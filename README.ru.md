<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <strong>Русский</strong> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="Значок FinderCut">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Вырезайте и вставляйте файлы в <strong>Finder</strong> с помощью <strong>⌘X</strong> и <strong>⌘V</strong> — бесплатно и с открытым исходным кодом.<br>
  Команда «Вырезать», которую macOS так и не дала Finder.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Платформа">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Цена">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="Лицензия">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Последняя версия"></a>
</p>

## Загрузка

| Система | Загрузка | Примечания |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon и Intel) | [Последняя версия](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Распакуйте архив и переместите `FinderCut.app` в папку «Программы». Подпись ad hoc (без нотаризации): если macOS заблокирует приложение при первом запуске, щёлкните по нему правой кнопкой мыши и выберите **Открыть**. Затем предоставьте разрешение **Универсальный доступ**, когда macOS его запросит, — оно нужно FinderCut, чтобы отслеживать ⌘X в Finder. |

Компилировать ничего не нужно — скачайте приложение со страницы [Releases](https://github.com/AbadXDev/findercut/releases) и пользуйтесь.

## Как это работает

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Выберите файл и нажмите Command X, откройте папку назначения, нажмите Command V — и файл переместится туда">
</p>

1. **Выберите файлы** в Finder и нажмите **`⌘X`** — FinderCut скопирует их и запомнит, что вырезание ожидает завершения. Ножницы в строке меню покажут ожидающее вырезание.
2. **Откройте папку назначения** и нажмите **`⌘V`** — FinderCut превратит эту вставку в штатную функцию Finder **Переместить объект сюда** (`⌥⌘V`), и файлы переместятся туда.
3. **Передумали?** Пока ещё ничего не переместилось — вырезание происходит только в момент вставки. Нажмите `Esc`, скопируйте что-нибудь другое с помощью `⌘C` или просто не вставляйте.

## Сочетания клавиш

| Клавиши | Что делает |
| --- | --- |
| `⌘X` | Вырезать выбранные файлы (помечает их для перемещения) |
| `⌘V` | Переместить вырезанные файлы в текущую папку — или обычная вставка, если вырезание не ожидает |
| `⌘C` | Копировать как обычно (и отменяет любое ожидающее вырезание) |
| `Esc` | Отменить ожидающее вырезание |

## FinderCut и платная альтернатива

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Цена | **Бесплатно** | $4 |
| Минимальная версия macOS | **13** | 26 |
| Исходный код | **Открытый (MIT)** | Закрытый |
| Apple silicon и Intel | ✅ Универсальный | — |

## Что он намеренно не ломает

- **Переименование файла:** пока Finder редактирует имя, `⌘X` / `⌘V` по-прежнему вырезают и вставляют *текст* — точно как обычно.
- **Другие приложения:** за пределами Finder FinderCut вообще ничего не делает.
- **Ваши файлы:** ничего не перемещается, не переименовывается и не удаляется, пока вы не вставите.

## Требования

- macOS 13 или новее, на Apple silicon или Intel.
- Разрешение **Универсальный доступ** (Системные настройки → Конфиденциальность и безопасность → Универсальный доступ). Пока вы его не предоставите, меню ножниц показывает «нет разрешения Универсального доступа»; после предоставления FinderCut подхватит его без перезапуска.

## Конфиденциальность

FinderCut ничего не собирает, никуда не обращается и не содержит аналитики. Он отслеживает нажатия клавиш только пока Finder — активное приложение, и только `⌘X`, `⌘V`, `⌘C` и `Esc`.

## Сборка из исходников

Требуются инструменты командной строки Xcode на macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Авторы и лицензия

- Приложение от **AbadXDev** — лицензия MIT (см. `LICENSE`).
- Не связано с Apple. Finder и macOS являются товарными знаками Apple Inc.
