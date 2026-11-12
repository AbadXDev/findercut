<p align="center">
  🌐 <a href="README.md">English</a> · <a href="README.es.md">Español</a> · <a href="README.fr.md">Français</a> · <a href="README.it.md">Italiano</a> · <strong>Português</strong> · <a href="README.de.md">Deutsch</a> · <a href="README.ru.md">Русский</a> · <a href="README.ja.md">日本語</a> · <a href="README.ko.md">한국어</a> · <a href="README.zh.md">简体中文</a> · <a href="README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <img src="assets/icon.png" width="160" alt="Ícone do FinderCut">
</p>

<h1 align="center">FinderCut</h1>

<p align="center"><strong>By AbadXDev</strong></p>

<p align="center">
  Corte e cole arquivos no <strong>Finder</strong> com <strong>⌘X</strong> e <strong>⌘V</strong> — gratuito e de código aberto.<br>
  O comando Cortar que o macOS nunca deu ao Finder.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2013%2B-blue" alt="Plataforma">
  <img src="https://img.shields.io/badge/price-Free-brightgreen" alt="Preço">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="Licença">
  <a href="https://github.com/AbadXDev/findercut/releases/latest"><img src="https://img.shields.io/github/v/release/AbadXDev/findercut" alt="Versão mais recente"></a>
</p>

<p align="center">🌐 **Bilingue:** a interface segue automaticamente o idioma do seu Mac — inglês ou espanhol. Também pode escolhê-lo por app em Ajustes do Sistema → Geral → Idioma e Região.</p>

## Download

| Sistema | Download | Notas |
| --- | --- | --- |
| **macOS** 13+ (Apple silicon e Intel) | [Versão mais recente](https://github.com/AbadXDev/findercut/releases/latest) → `FinderCut-v1.0.0.zip` | Descompacte e mova `FinderCut.app` para Aplicativos. Assinatura ad hoc (sem notarização): se o macOS bloquear o app na primeira vez, clique com o botão direito no app e escolha **Abrir**. Depois conceda a permissão de **Acessibilidade** quando o macOS pedir — o FinderCut precisa dela para detectar o ⌘X no Finder. |

Não é preciso compilar nada — baixe o app na página de [Releases](https://github.com/AbadXDev/findercut/releases) e use.

## Como funciona

<p align="center">
  <img src="assets/how-it-works.png" width="860" alt="Selecione um arquivo e pressione Command X, abra a pasta de destino, pressione Command V e o arquivo se move para lá">
</p>

1. **Selecione os arquivos** no Finder e pressione **`⌘X`** — o FinderCut os copia e lembra que há um corte pendente. A tesoura na sua barra de menus mostra o corte pendente.
2. **Abra a pasta de destino** e pressione **`⌘V`** — o FinderCut transforma essa colagem no **Mover Item Aqui** nativo do Finder (`⌥⌘V`), e os arquivos se movem para lá.
3. **Mudou de ideia?** Ainda nada se moveu — o corte só acontece na hora de colar. Pressione `Esc`, copie outra coisa com `⌘C` ou simplesmente não cole.

## Atalhos de teclado

| Teclas | O que faz |
| --- | --- |
| `⌘X` | Cortar os arquivos selecionados (marca-os para mover) |
| `⌘V` | Mover os arquivos cortados para a pasta atual — ou uma colagem normal se não houver corte pendente |
| `⌘C` | Copiar como sempre (e cancela qualquer corte pendente) |
| `Esc` | Cancelar o corte pendente |

## FinderCut vs. a alternativa paga

|  | **FinderCut** | Command X |
| --- | --- | --- |
| Preço | **Grátis** | $4 |
| macOS mínimo | **13** | 26 |
| Código-fonte | **Código aberto (MIT)** | Fechado |
| Apple silicon e Intel | ✅ Universal | — |

## O que ele deliberadamente não quebra

- **Renomear um arquivo:** enquanto o Finder está editando um nome, `⌘X` / `⌘V` continuam cortando e colando *texto*, exatamente como sempre.
- **Outros apps:** fora do Finder, o FinderCut não faz absolutamente nada.
- **Seus arquivos:** nada é movido, renomeado ou excluído até você colar.

## Requisitos

- macOS 13 ou posterior, em Apple silicon ou Intel.
- A permissão de **Acessibilidade** (Ajustes do Sistema → Privacidade e Segurança → Acessibilidade). Até você concedê-la, o menu da tesoura mostra “permissão de Acessibilidade ausente”; depois de concedida, o FinderCut a detecta sem precisar reiniciar o app.

## Privacidade

O FinderCut não coleta nada, não contata nenhum servidor e não tem ferramentas de análise. Ele só observa as teclas pressionadas enquanto o Finder é o app em primeiro plano, e apenas `⌘X`, `⌘V`, `⌘C` e `Esc`.

## Compilar a partir do código-fonte

Requer as ferramentas de linha de comando do Xcode no macOS 13+:

```sh
git clone https://github.com/AbadXDev/findercut.git
cd findercut
./build.sh        # produces FinderCut.app (universal, ad-hoc signed)
```

## Créditos e licença

- App de **AbadXDev** — Licença MIT (veja `LICENSE`).
- Sem afiliação com a Apple. Finder e macOS são marcas comerciais da Apple Inc.
