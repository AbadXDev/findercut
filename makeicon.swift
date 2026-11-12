// FinderCut icon generator — draws icon-1024.png
// Usage: swift makeicon.swift <output.png>
import Cocoa

let output = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "icon-1024.png"
let size = 1024

guard let rep = NSBitmapImageRep(bitmapDataPlanes: nil,
                                 pixelsWide: size, pixelsHigh: size,
                                 bitsPerSample: 8, samplesPerPixel: 4,
                                 hasAlpha: true, isPlanar: false,
                                 colorSpaceName: .deviceRGB,
                                 bytesPerRow: 0, bitsPerPixel: 0) else {
    fputs("makeicon: could not create bitmap\n", stderr)
    exit(1)
}
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)

// Rounded-rect background with a blue → purple gradient.
let margin: CGFloat = 60
let rect = NSRect(x: margin, y: margin, width: CGFloat(size) - margin * 2, height: CGFloat(size) - margin * 2)
let path = NSBezierPath(roundedRect: rect, xRadius: 200, yRadius: 200)
path.addClip()
let gradient = NSGradient(colors: [NSColor(calibratedRed: 0.16, green: 0.38, blue: 0.95, alpha: 1),
                                   NSColor(calibratedRed: 0.55, green: 0.25, blue: 0.90, alpha: 1)])!
gradient.draw(in: rect, angle: -45)

// Scissors glyph, big and centered.
let glyph = "✂️" as NSString
let attrs: [NSAttributedString.Key: Any] = [.font: NSFont.systemFont(ofSize: 560)]
let glyphSize = glyph.size(withAttributes: attrs)
glyph.draw(at: NSPoint(x: (CGFloat(size) - glyphSize.width) / 2,
                       y: (CGFloat(size) - glyphSize.height) / 2 + 40),
           withAttributes: attrs)

// "⌘X" caption at the bottom.
let caption = "⌘X" as NSString
let captionAttrs: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 190, weight: .bold),
    .foregroundColor: NSColor.white
]
let captionSize = caption.size(withAttributes: captionAttrs)
caption.draw(at: NSPoint(x: (CGFloat(size) - captionSize.width) / 2, y: 105),
             withAttributes: captionAttrs)

NSGraphicsContext.restoreGraphicsState()

guard let png = rep.representation(using: .png, properties: [:]) else {
    fputs("makeicon: could not encode PNG\n", stderr)
    exit(1)
}
try! png.write(to: URL(fileURLWithPath: output))
print("makeicon: wrote \(output)")
