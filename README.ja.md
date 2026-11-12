<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <strong>日本語</strong> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="FinderCut のアイコン">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  <strong>Finder</strong> でファイルを <strong>⌘X</strong> と <strong>⌘V</strong> で切り取り＆ペースト — 無料でオープンソース。<br>
  macOS が Finder に決して与えなかった「カット」コマンドです。
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="プラットフォーム">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="価格">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="ライセンス">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="最新リリース"></a>
</p>

<p align="center">🌐 **2か国語対応:** インターフェースはMacの言語に自動的に従います（英語またはスペイン語）。システム設定 → 一般 → 言語と地域 でアプリごとに選ぶこともできます。</p>

## ダウンロード

| システム | ダウンロード | 備考 |
| --- | --- | --- |
| **macOS** 13 以降（Apple silicon と Intel） | [最新リリース](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | 解凍して `FinderCut.app` を「アプリケーション」に移動してください。アドホック署名（未公証）のため、初回起動時に macOS にブロックされた場合は、アプリを右クリックして**開く**を選んでください。その後、macOS に求められたら**アクセシビリティ**の許可を与えてください — FinderCut が Finder での ⌘X を検知するために必要です。 |

コンパイルは不要です — [Releases](https://github.com/AbadXDev/findercut/releases) ページからアプリを入手してそのまま使えます。

## 仕組み

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="ファイルを選んで Command X を押し、移動先のフォルダを開いて Command V を押すと、ファイルがそこへ移動します">
</p>

1. Finder で**ファイルを選択**して **`⌘X`** を押す — FinderCut がそれらをコピーし、カットが保留中であることを覚えます。メニューバーのハサミが保留中のカットを表示します。
2. **移動先のフォルダを開いて** **`⌘V`** を押す — FinderCut がそのペーストを Finder ネイティブの**項目をここに移動**（`⌥⌘V`）に変え、ファイルがそこへ移動します。
3. **気が変わりましたか？** まだ何も移動していません — カットはペーストの時点で初めて実行されます。`Esc` を押すか、`⌘C` で別のものをコピーするか、そのままペーストしなければ大丈夫です。

## キーボードショートカット

| キー | 動作 |
| --- | --- |
| `⌘X` | 選択したファイルをカットする（移動対象としてマーク） |
| `⌘V` | カットしたファイルを現在のフォルダへ移動 — カットが保留中でなければ通常のペースト |
| `⌘C` | 通常どおりコピー（保留中のカットもキャンセル） |
| `Esc` | 保留中のカットをキャンセル |

## FinderCut と有料の代替品との比較

|  | **FinderCut** | Command X |
| --- | --- | --- |
| 価格 | **無料** | $4 |
| 最小 macOS | **13** | 26 |
| ソースコード | **オープンソース (MIT)** | 非公開 |
| Apple silicon と Intel | ✅ ユニバーサル | — |

## あえて壊さないもの

- **ファイル名の変更：** Finder が名前を編集中は、`⌘X` / `⌘V` はこれまでどおり*テキスト*を切り取り＆ペーストします。
- **ほかのアプリ：** Finder の外では、FinderCut は一切何もしません。
- **あなたのファイル：** ペーストするまで、何も移動・名前変更・削除されません。

## 要件

- macOS 13 以降、Apple silicon または Intel。
- **アクセシビリティ**の許可（システム設定 → プライバシーとセキュリティ → アクセシビリティ）。許可するまで、ハサミのメニューには「アクセシビリティの許可がありません」と表示されます。許可すれば、再起動なしで FinderCut がそれを反映します。

## プライバシー

FinderCut は何も収集せず、どこにも接続せず、解析機能もありません。Finder が最前面のアプリである間だけ、しかも `⌘X`、`⌘V`、`⌘C`、`Esc` のキー入力だけを監視します。

## ソースからビルド

macOS 13 以降で Xcode コマンドラインツールが必要です：

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## クレジットとライセンス

- **AbadXDev** によるアプリ — MIT ライセンス（`LICENSE` を参照）。
- Apple とは関係ありません。Finder と macOS は Apple Inc. の商標です。
