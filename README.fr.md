<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <strong>Français</strong> · <a href="README.it.md">Italiano</a> · <a href="README.pt.md">Português</a> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="Icône de FinderCut">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Coupez et collez des fichiers dans le <strong>Finder</strong> avec <strong>⌘X</strong> et <strong>⌘V</strong> — gratuit et open source.<br>
  La commande Couper que macOS n'a jamais donnée au Finder.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Plateforme">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Prix">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="Licence">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Dernière version"></a>
</p>

## Téléchargement

| Système | Téléchargement | Remarques |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon et Intel) | [Dernière version](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Décompressez le fichier et déplacez `FinderCut.app` dans Applications. Signature ad hoc (non notariée) : si macOS bloque l'app la première fois, faites un clic droit sur l'app et choisissez **Ouvrir**. Accordez ensuite l'autorisation **Accessibilité** lorsque macOS la demande — FinderCut en a besoin pour détecter ⌘X dans le Finder. |

Aucune compilation nécessaire — téléchargez l'app depuis la page [Releases](https://github.com/AbadXDev/findercut/releases) et utilisez-la.

## Fonctionnement

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Sélectionnez un fichier et appuyez sur Commande X, ouvrez le dossier de destination, appuyez sur Commande V et le fichier s'y déplace">
</p>

1. **Sélectionnez des fichiers** dans le Finder et appuyez sur **`⌘X`** — FinderCut les copie et retient qu'une coupe est en attente. Les ciseaux dans votre barre de menus indiquent la coupe en attente.
2. **Ouvrez le dossier de destination** et appuyez sur **`⌘V`** — FinderCut transforme ce collage en **Déplacer l'élément ici**, la fonction native du Finder (`⌥⌘V`), et les fichiers s'y déplacent.
3. **Vous avez changé d'avis ?** Rien n'a encore bougé — une coupe ne se produit qu'au moment du collage. Appuyez sur `Esc`, copiez autre chose avec `⌘C`, ou ne collez tout simplement pas.

## Raccourcis clavier

| Touches | Action |
| --- | --- |
| `⌘X` | Couper les fichiers sélectionnés (les marque pour les déplacer) |
| `⌘V` | Déplacer les fichiers coupés dans le dossier actuel — ou collage normal si aucune coupe n'est en attente |
| `⌘C` | Copier comme d'habitude (et annule toute coupe en attente) |
| `Esc` | Annuler la coupe en attente |

## FinderCut face à l'alternative payante

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Prix | **Gratuit** | $4 |
| macOS minimum | **13** | 26 |
| Code source | **Open source (MIT)** | Fermé |
| Apple silicon et Intel | ✅ Universel | — |

## Ce qu'il ne casse volontairement pas

- **Renommer un fichier :** lorsque le Finder modifie un nom, `⌘X` / `⌘V` continuent à couper et coller du *texte*, exactement comme d'habitude.
- **Les autres apps :** en dehors du Finder, FinderCut ne fait absolument rien.
- **Vos fichiers :** rien n'est déplacé, renommé ou supprimé tant que vous ne collez pas.

## Configuration requise

- macOS 13 ou version ultérieure, sur Apple silicon ou Intel.
- L'autorisation **Accessibilité** (Réglages Système → Confidentialité et sécurité → Accessibilité). Tant que vous ne l'accordez pas, le menu des ciseaux affiche « autorisation Accessibilité manquante » ; une fois accordée, FinderCut la prend en compte sans redémarrage.

## Confidentialité

FinderCut ne collecte rien, ne contacte aucun serveur et n'a aucun outil d'analyse. Il surveille uniquement les frappes de touches lorsque le Finder est l'app au premier plan, et seulement `⌘X`, `⌘V`, `⌘C` et `Esc`.

## Compiler depuis les sources

Nécessite les outils en ligne de commande Xcode sur macOS 13+ :

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Crédits et licence

- App par **AbadXDev** — Licence MIT (voir `LICENSE`).
- Sans affiliation avec Apple. Finder et macOS sont des marques commerciales d'Apple Inc.
