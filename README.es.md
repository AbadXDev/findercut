<p align="center">
  🌐 <a href="README.md">English</a> · <strong>Español</strong> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="Icono de FinderCut">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Corta y pega archivos en el <strong>Finder</strong> con <strong>⌘X</strong> y <strong>⌘V</strong> — gratis y de código abierto.<br>
  El comando Cortar que macOS nunca le dio al Finder.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Plataforma">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Precio">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="Licencia">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Última versión"></a>
</p>

## Descargar

| Sistema | Descarga | Notas |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon e Intel) | [Última versión](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Descomprime y mueve `FinderCut.app` a Aplicaciones. Firma ad hoc (sin notarizar): si macOS la bloquea la primera vez, haz clic derecho en la app y elige **Abrir**. Después concede el permiso de **Accesibilidad** cuando macOS lo pida: FinderCut lo necesita para detectar ⌘X en el Finder. |

Sin compilar nada: descarga la app desde la página de [Releases](https://github.com/AbadXDev/findercut/releases) y úsala.

## Cómo funciona

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Selecciona un archivo y pulsa Comando X, abre la carpeta destino, pulsa Comando V y el archivo se mueve ahí">
</p>

1. **Selecciona los archivos** en el Finder y pulsa **`⌘X`**: FinderCut los copia y recuerda que hay un corte pendiente. Las tijeras de tu barra de menús muestran el corte pendiente.
2. **Abre la carpeta destino** y pulsa **`⌘V`**: FinderCut convierte ese pegado en el **«Mover ítem aquí»** nativo del Finder (`⌥⌘V`) y los archivos se mueven ahí.
3. **¿Cambiaste de idea?** Todavía no se ha movido nada: el corte solo ocurre al pegar. Pulsa `Esc`, copia otra cosa con `⌘C` o simplemente no pegues.

## Atajos de teclado

| Teclas | Qué hace |
| --- | --- |
| `⌘X` | Cortar los archivos seleccionados (los marca para moverlos) |
| `⌘V` | Mover los archivos cortados a la carpeta actual, o un pegado normal si no hay corte pendiente |
| `⌘C` | Copiar como siempre (y cancela cualquier corte pendiente) |
| `Esc` | Cancelar el corte pendiente |

## FinderCut frente a la alternativa de pago

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Precio | **Gratis** | $4 |
| macOS mínimo | **13** | 26 |
| Código fuente | **Abierto (MIT)** | Cerrado |
| Apple silicon e Intel | ✅ Universal | — |

## Lo que no rompe a propósito

- **Renombrar un archivo:** mientras el Finder está editando un nombre, `⌘X` / `⌘V` siguen cortando y pegando *texto*, como siempre.
- **Otras apps:** fuera del Finder, FinderCut no hace nada en absoluto.
- **Tus archivos:** nada se mueve, renombra ni borra hasta que pegas.

## Requisitos

- macOS 13 o posterior, con Apple silicon o Intel.
- El permiso de **Accesibilidad** (Ajustes del Sistema → Privacidad y seguridad → Accesibilidad). Hasta que lo concedas, el menú de las tijeras muestra «falta el permiso de Accesibilidad»; al concederlo, FinderCut lo detecta sin reiniciar la app.

## Privacidad

FinderCut no recoge nada, no se conecta a ningún servidor y no tiene analíticas. Solo vigila las teclas mientras el Finder es la app en primer plano, y solo `⌘X`, `⌘V`, `⌘C` y `Esc`.

## Compilar desde el código

Requiere las herramientas de línea de comandos de Xcode en macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produce FinderCut.app (universal, firma ad hoc)
```

## Créditos y licencia

- App de **AbadXDev** — Licencia MIT (ver `LICENSE`).
- Sin afiliación con Apple. Finder y macOS son marcas de Apple Inc.
