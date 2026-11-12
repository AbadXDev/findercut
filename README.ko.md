<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <strong>한국어</strong> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="FinderCut 아이콘">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  <strong>Finder</strong>에서 <strong>⌘X</strong>와 <strong>⌘V</strong>로 파일을 잘라내고 붙여 넣으세요 — 무료이며 오픈 소스입니다.<br>
  macOS가 Finder에 결코 제공하지 않았던 잘라내기 명령입니다.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="플랫폼">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="가격">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="라이선스">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="최신 릴리스"></a>
</p>

<p align="center">🌐 **이중 언어:** 인터페이스가 Mac의 언어를 자동으로 따릅니다 — 영어 또는 스페인어. 시스템 설정 → 일반 → 언어 및 지역에서 앱별로 선택할 수도 있습니다.</p>

## 다운로드

| 시스템 | 다운로드 | 참고 |
| --- | --- | --- |
| **macOS** 13 이상(Apple silicon 및 Intel) | [최신 릴리스](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | 압축을 풀고 `FinderCut.app`을 응용 프로그램 폴더로 이동하세요. 임시 서명(공증되지 않음) 앱이므로, 처음 실행할 때 macOS가 차단하면 앱을 마우스 오른쪽 버튼으로 클릭하고 **열기**를 선택하세요. 그런 다음 macOS가 요청할 때 **손쉬운 사용** 권한을 허용하세요 — FinderCut이 Finder에서 ⌘X를 감지하려면 이 권한이 필요합니다. |

컴파일할 필요가 없습니다 — [Releases](https://github.com/AbadXDev/findercut/releases) 페이지에서 앱을 받아 바로 사용하세요.

## 작동 방식

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="파일을 선택하고 Command X를 누른 뒤, 대상 폴더를 열고 Command V를 누르면 파일이 그곳으로 이동합니다">
</p>

1. Finder에서 **파일을 선택**하고 **`⌘X`**를 누르세요 — FinderCut이 파일을 복사하고 잘라내기가 대기 중임을 기억합니다. 메뉴 막대의 가위가 대기 중인 잘라내기를 표시합니다.
2. **대상 폴더를 열고** **`⌘V`**를 누르세요 — FinderCut이 그 붙여 넣기를 Finder 기본 기능인 **여기로 항목 이동**(`⌥⌘V`)으로 바꿔, 파일이 그곳으로 이동합니다.
3. **마음이 바뀌었나요?** 아직 아무것도 이동되지 않았습니다 — 잘라내기는 붙여 넣는 순간에만 일어납니다. `Esc`를 누르거나, `⌘C`로 다른 것을 복사하거나, 그냥 붙여 넣지 않으면 됩니다.

## 키보드 단축키

| 키 | 동작 |
| --- | --- |
| `⌘X` | 선택한 파일 잘라내기(이동할 파일로 표시) |
| `⌘V` | 잘라낸 파일을 현재 폴더로 이동 — 대기 중인 잘라내기가 없으면 일반 붙여 넣기 |
| `⌘C` | 평소처럼 복사(대기 중인 잘라내기도 취소됨) |
| `Esc` | 대기 중인 잘라내기 취소 |

## FinderCut과 유료 대안 비교

|  | **FinderCut** | Command X |
| --- | --- | --- |
| 가격 | **무료** | $4 |
| 최소 macOS | **13** | 26 |
| 소스 코드 | **오픈 소스(MIT)** | 비공개 |
| Apple silicon 및 Intel | ✅ 유니버설 | — |

## 의도적으로 건드리지 않는 것

- **파일 이름 변경:** Finder가 이름을 편집하는 동안에는 `⌘X` / `⌘V`가 평소처럼 *텍스트*를 잘라내고 붙여 넣습니다.
- **다른 앱:** Finder 밖에서는 FinderCut이 아무것도 하지 않습니다.
- **내 파일:** 붙여 넣기 전까지는 어떤 파일도 이동, 이름 변경, 삭제되지 않습니다.

## 요구 사항

- macOS 13 이상, Apple silicon 또는 Intel.
- **손쉬운 사용** 권한(시스템 설정 → 개인정보 보호 및 보안 → 손쉬운 사용). 권한을 허용하기 전까지 가위 메뉴에는 “손쉬운 사용 권한 없음”이라고 표시되며, 허용하면 FinderCut이 다시 실행할 필요 없이 바로 인식합니다.

## 개인정보 보호

FinderCut은 아무것도 수집하지 않고, 어디에도 연결하지 않으며, 분석 기능도 없습니다. Finder가 가장 앞에 있는 앱일 때만 키 입력을 감시하고, 그것도 `⌘X`, `⌘V`, `⌘C`, `Esc`만 감시합니다.

## 소스에서 빌드하기

macOS 13 이상에서 Xcode 명령줄 도구가 필요합니다:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## 제작 및 라이선스

- **AbadXDev**가 만든 앱 — MIT 라이선스(`LICENSE` 참조).
- Apple과 관련이 없습니다. Finder와 macOS는 Apple Inc.의 상표입니다.
