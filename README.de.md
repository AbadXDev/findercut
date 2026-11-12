<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <strong>Deutsch</strong> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="FinderCut-Symbol">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Dateien im <strong>Finder</strong> mit <strong>⌘X</strong> und <strong>⌘V</strong> ausschneiden und einfügen — kostenlos und Open Source.<br>
  Der Befehl „Ausschneiden“, den macOS dem Finder nie gegeben hat.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Plattform">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Preis">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="Lizenz">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Neueste Version"></a>
</p>

## Download

| System | Download | Hinweise |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon und Intel) | [Neueste Version](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Entpacken und `FinderCut.app` in Programme bewegen. Ad-hoc signiert (nicht notarisiert): Wenn macOS die App beim ersten Mal blockiert, klicken Sie mit der rechten Maustaste auf die App und wählen Sie **Öffnen**. Erteilen Sie dann die Berechtigung **Bedienungshilfen**, wenn macOS danach fragt — FinderCut braucht sie, um ⌘X im Finder zu erkennen. |

Kein Kompilieren nötig — laden Sie die App von der [Releases](https://github.com/AbadXDev/findercut/releases)-Seite und nutzen Sie sie.

## So funktioniert es

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Datei auswählen und Befehl X drücken, Zielordner öffnen, Befehl V drücken, und die Datei wird dorthin bewegt">
</p>

1. **Dateien auswählen** im Finder und **`⌘X`** drücken — FinderCut kopiert sie und merkt sich, dass ein Ausschneiden aussteht. Die Schere in Ihrer Menüleiste zeigt das ausstehende Ausschneiden an.
2. **Zielordner öffnen** und **`⌘V`** drücken — FinderCut verwandelt dieses Einfügen in das Finder-eigene **Objekt hierher bewegen** (`⌥⌘V`), und die Dateien werden dorthin bewegt.
3. **Anders überlegt?** Noch wurde nichts bewegt — ein Ausschneiden geschieht erst beim Einfügen. Drücken Sie `Esc`, kopieren Sie etwas anderes mit `⌘C`, oder fügen Sie einfach nicht ein.

## Tastaturkurzbefehle

| Tasten | Was es tut |
| --- | --- |
| `⌘X` | Die ausgewählten Dateien ausschneiden (markiert sie zum Bewegen) |
| `⌘V` | Die ausgeschnittenen Dateien in den aktuellen Ordner bewegen — oder normales Einfügen, wenn kein Ausschneiden aussteht |
| `⌘C` | Kopieren wie gewohnt (und bricht jedes ausstehende Ausschneiden ab) |
| `Esc` | Das ausstehende Ausschneiden abbrechen |

## FinderCut im Vergleich zur kostenpflichtigen Alternative

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Preis | **Kostenlos** | $4 |
| Mindest-macOS | **13** | 26 |
| Quellcode | **Open Source (MIT)** | Geschlossen |
| Apple silicon und Intel | ✅ Universal | — |

## Was es absichtlich nicht kaputt macht

- **Eine Datei umbenennen:** Während der Finder einen Namen bearbeitet, schneiden und fügen `⌘X` / `⌘V` weiterhin *Text* aus und ein, genau wie gewohnt.
- **Andere Apps:** Außerhalb des Finders tut FinderCut überhaupt nichts.
- **Ihre Dateien:** Nichts wird bewegt, umbenannt oder gelöscht, bis Sie einfügen.

## Voraussetzungen

- macOS 13 oder neuer, auf Apple silicon oder Intel.
- Die Berechtigung **Bedienungshilfen** (Systemeinstellungen → Datenschutz & Sicherheit → Bedienungshilfen). Solange Sie sie nicht erteilen, zeigt das Scherenmenü „Berechtigung Bedienungshilfen fehlt“; nach dem Erteilen erkennt FinderCut sie ohne Neustart.

## Datenschutz

FinderCut sammelt nichts, kontaktiert keine Server und hat keine Analysefunktionen. Es beobachtet nur Tastendrücke, während der Finder die vorderste App ist, und nur `⌘X`, `⌘V`, `⌘C` und `Esc`.

## Aus den Quellen bauen

Erfordert die Xcode-Kommandozeilen-Tools auf macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Credits und Lizenz

- App von **AbadXDev** — MIT-Lizenz (siehe `LICENSE`).
- Nicht mit Apple verbunden. Finder und macOS sind Marken von Apple Inc.
