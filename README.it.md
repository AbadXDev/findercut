<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <strong>Italiano</strong> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="Icona di FinderCut">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Taglia e incolla file nel <strong>Finder</strong> con <strong>⌘X</strong> e <strong>⌘V</strong> — gratuito e open source.<br>
  Il comando Taglia che macOS non ha mai dato al Finder.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Piattaforma">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Prezzo">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="Licenza">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Ultima versione"></a>
</p>

## Download

| Sistema | Download | Note |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon e Intel) | [Ultima versione](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Decomprimi e sposta `FinderCut.app` in Applicazioni. Firma ad hoc (non autenticata): se macOS blocca l'app la prima volta, fai clic destro sull'app e scegli **Apri**. Poi concedi l'autorizzazione **Accessibilità** quando macOS la richiede — FinderCut ne ha bisogno per rilevare ⌘X nel Finder. |

Nessuna compilazione necessaria — scarica l'app dalla pagina [Releases](https://github.com/AbadXDev/findercut/releases) e usala.

## Come funziona

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Seleziona un file e premi Comando X, apri la cartella di destinazione, premi Comando V e il file si sposta lì">
</p>

1. **Seleziona i file** nel Finder e premi **`⌘X`** — FinderCut li copia e ricorda che c'è un taglio in sospeso. Le forbici nella barra dei menu mostrano il taglio in sospeso.
2. **Apri la cartella di destinazione** e premi **`⌘V`** — FinderCut trasforma l'incolla in **Sposta elemento qui**, la funzione nativa del Finder (`⌥⌘V`), e i file si spostano lì.
3. **Hai cambiato idea?** Non si è ancora spostato nulla — il taglio avviene solo quando incolli. Premi `Esc`, copia qualcos'altro con `⌘C`, o semplicemente non incollare.

## Scorciatoie da tastiera

| Tasti | Cosa fa |
| --- | --- |
| `⌘X` | Taglia i file selezionati (li contrassegna per lo spostamento) |
| `⌘V` | Sposta i file tagliati nella cartella attuale — oppure un normale incolla se non c'è un taglio in sospeso |
| `⌘C` | Copia come sempre (e annulla qualsiasi taglio in sospeso) |
| `Esc` | Annulla il taglio in sospeso |

## FinderCut contro l'alternativa a pagamento

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Prezzo | **Gratuito** | $4 |
| macOS minimo | **13** | 26 |
| Codice sorgente | **Open source (MIT)** | Chiuso |
| Apple silicon e Intel | ✅ Universale | — |

## Cosa non rompe di proposito

- **Rinominare un file:** mentre il Finder sta modificando un nome, `⌘X` / `⌘V` continuano a tagliare e incollare *testo*, esattamente come sempre.
- **Altre app:** fuori dal Finder, FinderCut non fa assolutamente nulla.
- **I tuoi file:** nulla viene spostato, rinominato o eliminato finché non incolli.

## Requisiti

- macOS 13 o successivo, su Apple silicon o Intel.
- L'autorizzazione **Accessibilità** (Impostazioni di Sistema → Privacy e sicurezza → Accessibilità). Finché non la concedi, il menu delle forbici mostra «autorizzazione Accessibilità mancante»; una volta concessa, FinderCut la rileva senza bisogno di riavviare l'app.

## Privacy

FinderCut non raccoglie nulla, non contatta nessun server e non ha strumenti di analisi. Osserva solo i tasti premuti mentre il Finder è l'app in primo piano, e solo `⌘X`, `⌘V`, `⌘C` ed `Esc`.

## Compilare dai sorgenti

Richiede gli strumenti a riga di comando di Xcode su macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Crediti e licenza

- App di **AbadXDev** — Licenza MIT (vedi `LICENSE`).
- Nessuna affiliazione con Apple. Finder e macOS sono marchi di Apple Inc.
