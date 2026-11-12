// FinderCut — Corta y pega archivos en Finder con Cmd+X y Cmd+V
// Free and open source (MIT). By AbadXDev.
// https://github.com/AbadXDev/findercut
//
// How it works:
//  - A CGEvent tap watches key presses only while Finder is frontmost.
//  - Cmd+X is swallowed and replaced by a synthetic Cmd+C (copy), and the
//    app remembers that a "cut" is pending.
//  - The next Cmd+V in Finder is replaced by Option+Cmd+V, which is
//    Finder's native "Move Item Here". The file is only moved at paste
//    time, exactly how macOS likes it — nothing is lost if you never paste.
//  - When Finder is editing text (renaming a file), Cmd+X / Cmd+V are
//    left untouched so text cut/paste keeps working normally.

import Cocoa
import ApplicationServices
import ServiceManagement

#if APPSTORE
import StoreKit
#endif

private let kMagic: Int64 = 0x46435554 // "FCUT" — tags our synthetic events
private let kKeyX: CGKeyCode = 7
private let kKeyC: CGKeyCode = 8
private let kKeyV: CGKeyCode = 9
private let kKeyEscape: CGKeyCode = 53
private let kFinderBundleID = "com.apple.finder"
private let kWebsiteURL = "https://abadxdev.github.io/findercut/"
private let kPrivacyURL = "https://abadxdev.github.io/findercut/privacy.html"
#if APPSTORE
private let kTipProductIDs = ["dev.abadx.findercut.tip3",
                              "dev.abadx.findercut.tip4",
                              "dev.abadx.findercut.tip10"]
#endif

private func eventTapCallback(proxy: CGEventTapProxy,
                              type: CGEventType,
                              event: CGEvent,
                              refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    guard let refcon = refcon else { return Unmanaged.passUnretained(event) }
    let delegate = Unmanaged<AppDelegate>.fromOpaque(refcon).takeUnretainedValue()
    return delegate.handle(proxy: proxy, type: type, event: event)
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!
    private var stateItem: NSMenuItem!
    private var pendingItem: NSMenuItem!
    private var pauseItem: NSMenuItem!
    private var loginItem: NSMenuItem!

    private var eventTap: CFMachPort?
    private var cutPending = false
    private var pendingCount = 0
    private var expectedChangeCount = -1
    private var paused = false
    private var pollTimer: Timer?

    // MARK: - App lifecycle

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        setupStatusItem()
#if APPSTORE
        TipStore.startListening()
#endif

        if !AXIsProcessTrusted() {
            // Ask macOS to show the Accessibility prompt for FinderCut.
            let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
            _ = AXIsProcessTrustedWithOptions(options)
        }
        installTapIfTrusted()
        updateMenu()

        // Poll: pick up the Accessibility grant when the user enables it
        // (no relaunch needed), and drop a pending cut if the clipboard
        // was replaced by something copied elsewhere.
        pollTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.eventTap == nil { self.installTapIfTrusted() }
            if self.cutPending, self.expectedChangeCount >= 0,
               NSPasteboard.general.changeCount != self.expectedChangeCount {
                self.clearCut()
            }
        }
    }

    // MARK: - Status bar UI

    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "scissors",
                                   accessibilityDescription: "FinderCut")
            button.title = ""
            button.toolTip = "FinderCut — Cmd+X para cortar archivos en Finder"
        }

        let menu = NSMenu()
        let header = NSMenuItem(title: "FinderCut — By AbadXDev", action: nil, keyEquivalent: "")
        header.isEnabled = false
        menu.addItem(header)

        stateItem = NSMenuItem(title: "Estado: …", action: nil, keyEquivalent: "")
        stateItem.isEnabled = false
        menu.addItem(stateItem)

        pendingItem = NSMenuItem(title: "Sin corte pendiente", action: nil, keyEquivalent: "")
        pendingItem.isEnabled = false
        menu.addItem(pendingItem)

        menu.addItem(.separator())

        pauseItem = NSMenuItem(title: "Pausar FinderCut", action: #selector(togglePause), keyEquivalent: "")
        pauseItem.target = self
        menu.addItem(pauseItem)

        let accessItem = NSMenuItem(title: "Conceder permiso de Accesibilidad…",
                                    action: #selector(openAccessibilitySettings), keyEquivalent: "")
        accessItem.target = self
        menu.addItem(accessItem)

        loginItem = NSMenuItem(title: "Iniciar al abrir sesión", action: #selector(toggleLoginItem), keyEquivalent: "")
        loginItem.target = self
        menu.addItem(loginItem)

        menu.addItem(.separator())

        let supportItem = NSMenuItem(title: "Apoyar FinderCut ❤️…", action: #selector(openSupport), keyEquivalent: "")
        supportItem.target = self
        menu.addItem(supportItem)

#if APPSTORE
        let privacyItem = NSMenuItem(title: "Política de privacidad…", action: #selector(openPrivacy), keyEquivalent: "")
        privacyItem.target = self
        menu.addItem(privacyItem)
#endif

        let aboutItem = NSMenuItem(title: "Acerca de FinderCut", action: #selector(showAbout), keyEquivalent: "")
        aboutItem.target = self
        menu.addItem(aboutItem)

        menu.addItem(.separator())

        let quitItem = NSMenuItem(title: "Salir de FinderCut", action: #selector(quit), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)

        statusItem.menu = menu
    }

    private func updateMenu() {
        if statusItem == nil { return }
        let trusted = AXIsProcessTrusted()
        if !trusted {
            stateItem.title = "Estado: falta el permiso de Accesibilidad"
        } else if paused {
            stateItem.title = "Estado: en pausa"
        } else {
            stateItem.title = "Estado: activo"
        }
        pendingItem.title = cutPending
            ? "Corte pendiente: \(pendingCount > 0 ? "\(pendingCount) elemento(s)" : "elementos") — Cmd+V en otra carpeta para mover"
            : "Sin corte pendiente"
        pauseItem.title = paused ? "Reanudar FinderCut" : "Pausar FinderCut"
        loginItem.state = (SMAppService.mainApp.status == .enabled) ? .on : .off
        if let button = statusItem.button {
            button.title = cutPending ? " •" : ""
        }
    }

    @objc private func togglePause() {
        paused.toggle()
        if paused { clearCut() }
        updateMenu()
    }

    @objc private func openAccessibilitySettings() {
        let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
        _ = AXIsProcessTrustedWithOptions(options)
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
            NSWorkspace.shared.open(url)
        }
    }

    @objc private func toggleLoginItem() {
        do {
            if SMAppService.mainApp.status == .enabled {
                try SMAppService.mainApp.unregister()
            } else {
                try SMAppService.mainApp.register()
            }
        } catch {
            NSLog("FinderCut: login item toggle failed: \(error)")
        }
        updateMenu()
    }

    @objc private func openSupport() {
#if APPSTORE
        Task { await TipStore.showTips() }
#else
        if let url = URL(string: "https://github.com/sponsors/AbadXDev") {
            NSWorkspace.shared.open(url)
        }
#endif
    }

#if APPSTORE
    @objc private func openPrivacy() {
        if let url = URL(string: kPrivacyURL) {
            NSWorkspace.shared.open(url)
        }
    }
#endif

    @objc private func showAbout() {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "?"
        let alert = NSAlert()
        alert.messageText = "FinderCut \(version)"
        alert.alertStyle = .informational
        NSApp.activate(ignoringOtherApps: true)
#if APPSTORE
        alert.informativeText = "Corta y pega archivos en Finder con Cmd+X y Cmd+V.\n\nBy AbadXDev · Licencia MIT\nRequiere macOS 13 o posterior\n\nWeb: https://abadxdev.github.io/findercut/"
        alert.addButton(withTitle: "Sitio web")
        alert.addButton(withTitle: "Cerrar")
        if alert.runModal() == .alertFirstButtonReturn, let url = URL(string: kWebsiteURL) {
            NSWorkspace.shared.open(url)
        }
#else
        alert.informativeText = "Corta y pega archivos en Finder con Cmd+X y Cmd+V.\n\nBy AbadXDev · Licencia MIT\nRequiere macOS 13 o posterior\n\nCódigo: https://github.com/AbadXDev/findercut\nWeb: https://abadxdev.github.io/findercut/"
        alert.addButton(withTitle: "Ver en GitHub")
        alert.addButton(withTitle: "Apoyar ❤️")
        alert.addButton(withTitle: "Cerrar")
        let response = alert.runModal()
        if response == .alertFirstButtonReturn, let url = URL(string: "https://github.com/AbadXDev/findercut") {
            NSWorkspace.shared.open(url)
        } else if response == .alertSecondButtonReturn {
            openSupport()
        }
#endif
    }

    @objc private func quit() {
        NSApp.terminate(nil)
    }

    // MARK: - Event tap

    private func installTapIfTrusted() {
        guard eventTap == nil, AXIsProcessTrusted() else { return }
        let mask = CGEventMask(1 << CGEventType.keyDown.rawValue)
        guard let tap = CGEvent.tapCreate(tap: .cgSessionEventTap,
                                          place: .headInsertEventTap,
                                          options: .defaultTap,
                                          eventsOfInterest: mask,
                                          callback: eventTapCallback,
                                          userInfo: Unmanaged.passUnretained(self).toOpaque()) else {
            return
        }
        let source = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, tap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), source, .commonModes)
        CGEvent.tapEnable(tap: tap, enable: true)
        eventTap = tap
        updateMenu()
    }

    fileprivate func handle(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent) -> Unmanaged<CGEvent>? {
        if type == .tapDisabledByTimeout || type == .tapDisabledByUserInput {
            if let tap = eventTap { CGEvent.tapEnable(tap: tap, enable: true) }
            return Unmanaged.passUnretained(event)
        }
        guard type == .keyDown else { return Unmanaged.passUnretained(event) }
        // Never touch our own synthetic events.
        if event.getIntegerValueField(.eventSourceUserData) == kMagic {
            return Unmanaged.passUnretained(event)
        }
        guard !paused else { return Unmanaged.passUnretained(event) }
        guard NSWorkspace.shared.frontmostApplication?.bundleIdentifier == kFinderBundleID else {
            return Unmanaged.passUnretained(event)
        }

        let keyCode = CGKeyCode(event.getIntegerValueField(.keyboardEventKeycode))
        let flags = event.flags
        let plainCmd = flags.contains(.maskCommand)
            && !flags.contains(.maskShift)
            && !flags.contains(.maskAlternate)
            && !flags.contains(.maskControl)

        if keyCode == kKeyEscape && !flags.contains(.maskCommand) {
            if cutPending { DispatchQueue.main.async { self.clearCut() } }
            return Unmanaged.passUnretained(event)
        }

        guard plainCmd, keyCode == kKeyX || keyCode == kKeyV || keyCode == kKeyC else {
            return Unmanaged.passUnretained(event)
        }
        // While renaming a file, X/V/C are text operations — leave them alone.
        if finderIsEditingText() { return Unmanaged.passUnretained(event) }

        switch keyCode {
        case kKeyX:
            DispatchQueue.main.async {
                self.cutPending = true
                self.pendingCount = 0
                self.expectedChangeCount = -1
                self.postSyntheticKey(kKeyC, flags: [.maskCommand])
                // Give Finder a moment to fill the pasteboard, then record
                // what was cut so the menu (and clipboard watching) is exact.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    let pb = NSPasteboard.general
                    self.expectedChangeCount = pb.changeCount
                    let urls = pb.readObjects(forClasses: [NSURL.self], options: nil) ?? []
                    self.pendingCount = urls.count
                    self.updateMenu()
                }
                self.updateMenu()
            }
            return nil // swallow the original Cmd+X

        case kKeyV:
            guard cutPending else { return Unmanaged.passUnretained(event) }
            DispatchQueue.main.async {
                self.clearCut()
                self.postSyntheticKey(kKeyV, flags: [.maskCommand, .maskAlternate])
            }
            return nil // swallow the original Cmd+V; the move replaces it

        case kKeyC:
            // A fresh copy cancels any pending cut.
            if cutPending { DispatchQueue.main.async { self.clearCut() } }
            return Unmanaged.passUnretained(event)

        default:
            return Unmanaged.passUnretained(event)
        }
    }

    private func clearCut() {
        cutPending = false
        pendingCount = 0
        expectedChangeCount = -1
        updateMenu()
    }

    private func postSyntheticKey(_ key: CGKeyCode, flags: CGEventFlags) {
        for keyDown in [true, false] {
            guard let e = CGEvent(keyboardEventSource: nil, virtualKey: key, keyDown: keyDown) else { continue }
            e.flags = flags
            e.setIntegerValueField(.eventSourceUserData, value: kMagic)
            e.post(tap: .cghidEventTap)
        }
    }

    // MARK: - Is Finder editing text (rename)?

    private func finderIsEditingText() -> Bool {
        guard let finder = NSWorkspace.shared.runningApplications.first(where: { $0.bundleIdentifier == kFinderBundleID }) else {
            return false
        }
        let appElement = AXUIElementCreateApplication(finder.processIdentifier)
        var focused: CFTypeRef?
        guard AXUIElementCopyAttributeValue(appElement, kAXFocusedUIElementAttribute as CFString, &focused) == .success,
              let element = focused else { return false }
        var role: CFTypeRef?
        guard AXUIElementCopyAttributeValue(element as! AXUIElement, kAXRoleAttribute as CFString, &role) == .success,
              let roleString = role as? String else { return false }
        return roleString == (kAXTextFieldRole as String) || roleString == (kAXTextAreaRole as String)
    }
}

#if APPSTORE
// MARK: - Support tips (StoreKit) — Mac App Store build only
//
// Voluntary one-time tips handled entirely by Apple's in-app purchase.
// FinderCut is fully free: a tip unlocks nothing and changes nothing.
enum TipStore {
    private static var updatesTask: Task<Void, Never>?

    static func startListening() {
        guard updatesTask == nil else { return }
        updatesTask = Task {
            for await result in Transaction.updates {
                if let transaction = try? result.payloadValue {
                    await transaction.finish()
                }
            }
        }
    }

    @MainActor
    static func showTips() async {
        let products = (try? await Product.products(for: kTipProductIDs)) ?? []
        let sorted = products.sorted { $0.price < $1.price }
        let alert = NSAlert()
        alert.messageText = "Apoyar FinderCut ❤️"
        alert.alertStyle = .informational
        NSApp.activate(ignoringOtherApps: true)
        if sorted.isEmpty {
            alert.informativeText = "Las opciones de apoyo no están disponibles en este momento. FinderCut sigue siendo gratuito y completo."
            alert.addButton(withTitle: "Cerrar")
            alert.runModal()
            return
        }
        alert.informativeText = "FinderCut es gratuito y de código abierto. Si te resulta útil, puedes apoyar su desarrollo con una propina única. No desbloquea nada: es solo una forma de dar las gracias."
        for product in sorted {
            alert.addButton(withTitle: "Apoyar con \(product.displayPrice)")
        }
        alert.addButton(withTitle: "Cancelar")
        let response = alert.runModal()
        let index = response.rawValue - NSApplication.ModalResponse.alertFirstButtonReturn.rawValue
        guard index >= 0, index < sorted.count else { return }
        await purchase(sorted[index])
    }

    @MainActor
    private static func purchase(_ product: Product) async {
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                if let transaction = try? verification.payloadValue {
                    await transaction.finish()
                    let thanks = NSAlert()
                    thanks.messageText = "¡Muchas gracias! ❤️"
                    thanks.informativeText = "Tu apoyo ayuda a que FinderCut siga siendo gratuito y de código abierto."
                    thanks.alertStyle = .informational
                    thanks.addButton(withTitle: "Cerrar")
                    NSApp.activate(ignoringOtherApps: true)
                    thanks.runModal()
                }
            case .userCancelled, .pending:
                break
            @unknown default:
                break
            }
        } catch {
            NSLog("FinderCut: tip purchase failed: \(error)")
        }
    }
}
#endif

let delegate = AppDelegate()
NSApplication.shared.delegate = delegate
NSApplication.shared.run()
