# vim-rozi-navigator agent guide

## Mission

Keep Vim, Neovim, and Rozi pane navigation feeling like one split tree. The repository contains two
independently installed parts: a Vim plugin and a declarative Rozi extension manifest.

## Commands

- Vim smoke test: `vim -Nu NONE -n -es -S tests/smoke.vim`
- Help tags: `vim -Nu NONE -n -es +'helptags doc' +quitall`
- Manifest validation: `rozi extensions check .`
- Whitespace check: `git diff --check`

## Workflow rules

- Use only documented Vim APIs and Rozi's public extension and `run-action` interfaces.
- Keep Vim 8.0+ compatibility unless a deliberate breaking change is documented.
- Keep `README.md`, `doc/rozi-navigator.txt`, and `doc/tags` synchronized.
- Installing the Vim plugin must not register or modify the Rozi extension automatically.
- Update this guide when durable repository conventions change.

## Commits

- Use Conventional Commits and include a DCO `Signed-off-by` trailer.
- Do not commit generated editor files, local configuration, credentials, or runtime data.
