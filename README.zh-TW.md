<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <strong>繁體中文</strong>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="FinderCut 圖示">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  在 <strong>Finder</strong> 中使用 <strong>⌘X</strong> 和 <strong>⌘V</strong> 剪下和貼上檔案 — 免費且開源。<br>
  這是 macOS 從未給 Finder 的剪下指令。
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="平台">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="價格">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="授權">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="最新版本"></a>
</p>

<p align="center">🌐 **雙語:** 介面會自動跟隨你的 Mac 語言——英語或西班牙語。也可以在「系統設定 → 一般 → 語言與地區」中為每個 App 單獨選擇。</p>

## 下載

| 系統 | 下載 | 說明 |
| --- | --- | --- |
| **macOS** 13+（Apple silicon 和 Intel） | [最新版本](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | 解壓縮後將 `FinderCut.app` 移到「應用程式」資料夾。臨時簽名（未公證）：如果首次執行時被 macOS 阻止，請右鍵點按該應用程式並選擇**打開**。然後在 macOS 詢問時授予**輔助使用**權限 — FinderCut 需要它來監聽 Finder 中的 ⌘X。 |

無需編譯 — 直接從 [Releases](https://github.com/AbadXDev/findercut/releases) 頁面下載應用程式即可使用。

## 運作原理

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="選擇一個檔案並按 Command X，打開目標資料夾，按 Command V，檔案就會移到那裡">
</p>

1. 在 Finder 中**選擇檔案**並按 **`⌘X`** — FinderCut 會複製這些檔案並記住有一次剪下正在等待。選單列中的剪刀圖示會顯示待處理的剪下。
2. **打開目標資料夾**並按 **`⌘V`** — FinderCut 會將這次貼上變成 Finder 原生的**將項目移到這裡**（`⌥⌘V`），檔案隨即移動到那裡。
3. **改變主意了？** 檔案還沒有移動 — 剪下只在貼上時才真正發生。按 `Esc`、用 `⌘C` 複製其他內容，或者乾脆不要貼上即可。

## 鍵盤快速鍵

| 按鍵 | 作用 |
| --- | --- |
| `⌘X` | 剪下所選檔案（標記為要移動） |
| `⌘V` | 將剪下的檔案移到目前資料夾 — 如果沒有待處理的剪下，則為普通貼上 |
| `⌘C` | 照常複製（並取消任何待處理的剪下） |
| `Esc` | 取消待處理的剪下 |

## FinderCut 與付費替代品比較

|  | **FinderCut** | Command X |
| --- | --- | --- |
| 價格 | **免費** | $4 |
| 最低 macOS 版本 | **13** | 26 |
| 原始碼 | **開源 (MIT)** | 閉源 |
| Apple silicon 和 Intel | ✅ 通用二進位檔 | — |

## 它刻意不會破壞的東西

- **重新命名檔案：** 當 Finder 正在編輯檔案名稱時，`⌘X` / `⌘V` 仍然像往常一樣剪下和貼上*文字*。
- **其他應用程式：** 在 Finder 之外，FinderCut 什麼都不做。
- **你的檔案：** 在你貼上之前，任何檔案都不會被移動、重新命名或刪除。

## 系統需求

- macOS 13 或更高版本，Apple silicon 或 Intel 均可。
- **輔助使用**權限（系統設定 → 隱私權與安全性 → 輔助使用）。在授予之前，剪刀選單會顯示「缺少輔助使用權限」；授予後 FinderCut 會自動生效，無需重新啟動。

## 隱私權

FinderCut 不收集任何資料，不連接任何伺服器，也沒有分析統計。它只在 Finder 位於前景時監聽按鍵，且只監聽 `⌘X`、`⌘V`、`⌘C` 和 `Esc`。

## 從原始碼建置

需要在 macOS 13+ 上安裝 Xcode 命令列工具：

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## 製作與授權

- 應用程式由 **AbadXDev** 製作 — MIT 授權（見 `LICENSE`）。
- 與 Apple 無關。Finder 和 macOS 是 Apple Inc. 的商標。
