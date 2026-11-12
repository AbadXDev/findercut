# FinderCut ✂️

**Cut and paste files in Finder with `⌘X` and `⌘V` — free and open source.**

Finder has never had a Cut command for files: the Edit menu shows it greyed
out, and `⌘X` only works on text. The paid utilities that fix this cost money
and the newest ones require the latest macOS. FinderCut does the same job for
free, is fully open source (MIT), and runs on **macOS 13 or later**, on both
Apple silicon and Intel Macs.

## How it works

FinderCut lives in your menu bar and only acts while Finder is in front:

1. Select files in Finder and press **`⌘X`** — FinderCut copies them and
   remembers a cut is pending.
2. Open the destination folder and press **`⌘V`** — FinderCut turns that
   paste into Finder's native **Move Item Here** (`⌥⌘V`).

Nothing is moved until you paste, so a cut can never lose a file: if you
change your mind, press `Esc`, copy something else, or just don't paste.

Things it deliberately does **not** break:

- **Renaming a file:** while Finder is editing a name, `⌘X` / `⌘V` still cut
  and paste *text*, exactly as usual.
- **Other apps:** outside Finder, FinderCut does nothing at all.
- **Fresh copies:** pressing `⌘C` cancels a pending cut.

## Install

### From a release

1. Download `FinderCut-v1.0.0.zip` from the
   [Releases page](https://github.com/AbadXDev/findercut/releases), unzip it
   and move `FinderCut.app` to Applications.
2. Launch it. macOS will ask for **Accessibility** permission — FinderCut
   needs it to watch for `⌘X` in Finder. Grant it in
   *System Settings → Privacy & Security → Accessibility*.
   Until you do, the scissors menu shows “missing Accessibility permission”.
3. Done. The scissors icon sits in your menu bar; from there you can pause
   FinderCut, make it start at login, or quit it.

> The app is ad-hoc signed (not notarized), so on first launch macOS may ask
> you to right-click the app and choose **Open** once.

### Build it yourself

Requires Xcode Command Line Tools on macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Privacy

FinderCut collects nothing, phones nowhere, and has no analytics. It only
watches key presses while Finder is the frontmost app, and only `⌘X`,
`⌘V`, `⌘C` and `Esc`.

## License

MIT — see [LICENSE](LICENSE). By **AbadXDev**.

---

## En español

**Corta y pega archivos en el Finder con `⌘X` y `⌘V` — gratis y de código
abierto.**

El Finder nunca ha tenido un comando Cortar para archivos: en el menú
Edición aparece en gris y `⌘X` solo funciona con texto. FinderCut lo
resuelve gratis, con código abierto (MIT) y funciona en **macOS 13 o
posterior**, en Macs con Apple silicon e Intel.

- Selecciona archivos y pulsa **`⌘X`**: se copian y queda un corte pendiente.
- Ve a la carpeta destino y pulsa **`⌘V`**: se mueven ahí, con el «Mover
  ítem aquí» nativo del Finder.

Nada se mueve hasta que pegas, así que un corte nunca pierde un archivo.
Al renombrar un archivo, `⌘X`/`⌘V` siguen cortando y pegando *texto* como
siempre, y fuera del Finder la app no toca nada.

**Instalación:** descarga el ZIP de
[Releases](https://github.com/AbadXDev/findercut/releases), mueve
`FinderCut.app` a Aplicaciones, ábrela y concédele el permiso de
**Accesibilidad** cuando macOS lo pida (Ajustes → Privacidad y seguridad →
Accesibilidad). Al ser una app firmada ad hoc, la primera vez quizá tengas
que abrirla con clic derecho → **Abrir**.

**Compilar:** `./build.sh` con las herramientas de línea de comandos de
Xcode. Sin telemetría ni conexión a ningún servidor.
