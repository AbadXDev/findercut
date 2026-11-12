<p align="center">
  🌐 <strong>English</strong> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="FinderCut icon">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Cut and paste files in <strong>Finder</strong> with <strong>⌘X</strong> and <strong>⌘V</strong> — free and open source.<br>
  The Cut command macOS never gave Finder.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Platform">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Price">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Latest release"></a>
</p>

## Download

| System | Download | Notes |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon & Intel) | [Latest release](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Unzip and move `FinderCut.app` to Applications. Ad-hoc signed (not notarized): if macOS blocks it the first time, right-click the app and choose **Open**. Then grant the **Accessibility** permission when macOS asks — FinderCut needs it to watch for ⌘X in Finder. |

No compiling needed — grab the app from the [Releases](https://github.com/AbadXDev/findercut/releases) page and use it.

## How it works

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Select a file and press Command X, open the destination folder, press Command V and the file moves there">
</p>

1. **Select files** in Finder and press **`⌘X`** — FinderCut copies them and remembers that a cut is pending. The scissors in your menu bar shows the pending cut.
2. **Open the destination folder** and press **`⌘V`** — FinderCut turns that paste into Finder's native **Move Item Here** (`⌥⌘V`), and the files move there.
3. **Changed your mind?** Nothing has moved yet — a cut only happens at paste time. Press `Esc`, copy something else with `⌘C`, or simply don't paste.

## Keyboard shortcuts

| Keys | What it does |
| --- | --- |
| `⌘X` | Cut the selected files (marks them to move) |
| `⌘V` | Move the cut files into the current folder — or a normal paste if no cut is pending |
| `⌘C` | Copy as usual (and cancels any pending cut) |
| `Esc` | Cancel the pending cut |

## FinderCut vs. the paid alternative

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Price | **Free** | $4 |
| Minimum macOS | **13** | 26 |
| Source code | **Open source (MIT)** | Closed |
| Apple silicon & Intel | ✅ Universal | — |

## What it deliberately does not break

- **Renaming a file:** while Finder is editing a name, `⌘X` / `⌘V` still cut and paste *text*, exactly as usual.
- **Other apps:** outside Finder, FinderCut does nothing at all.
- **Your files:** nothing is moved, renamed or deleted until you paste.

## Requirements

- macOS 13 or later, on Apple silicon or Intel.
- The **Accessibility** permission (System Settings → Privacy & Security → Accessibility). Until you grant it, the scissors menu shows “missing Accessibility permission”; grant it and FinderCut picks it up with no relaunch.

## Privacy

FinderCut collects nothing, phones nowhere, and has no analytics. It only watches key presses while Finder is the frontmost app, and only `⌘X`, `⌘V`, `⌘C` and `Esc`.

## Build from source

Requires Xcode Command Line Tools on macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Credits & license

- App by **AbadXDev** — MIT License (see `LICENSE`).
- Not affiliated with Apple. Finder and macOS are trademarks of Apple Inc.
