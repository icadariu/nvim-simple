# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal Neovim config (Lua) intended to be cloned to `~/.config/nvim`. There is no build, no test suite, and no application code — changes are validated by loading them in Neovim. Plugin management is `lazy.nvim`; the lockfile (`lazy-lock.json`) is committed and is the source of truth for plugin versions.

## Architecture

Boot path: `init.lua` disables ruby/perl providers, bootstraps `lazy.nvim`, then in order:

1. `require "config.options"` — `vim.opt.*` settings, autocmds for trim-on-save and yank-highlight, spellfile path.
2. `require "config.keymaps"` — all custom keymaps. Pulls toggles from `lua/utils.lua`.
3. `require "config.global"` — `vim.g.*` and the `:CheckDuplicates` user command.
4. `lazy.setup("plugins", ...)` — `lazy.nvim` **auto-discovers every `lua/plugins/*.lua`**. Each file returns a single plugin spec (or list of related specs). To add a plugin, drop a new file in `lua/plugins/`; do not register it elsewhere.

Cross-cutting wiring worth knowing:

- **Formatting** is centralized in `lua/plugins/conform.lua`. Format-on-save is gated by `vim.g.disable_autoformat` and `vim.b[buf].disable_autoformat` (toggle: `<leader>uf` → `utils.toggle_autoformat`). `zsh` is explicitly skipped. Formatters per filetype: `stylua` (lua), `prettierd`/`prettier` (json/yaml/markdown), `shfmt` (sh/bash), `terraform_fmt`.
- **Linting** is in `lua/plugins/nvim-lint.lua`. Runs on `BufWritePost`/`BufReadPost`/`InsertLeave`. Shellcheck linters are registered only if `shellcheck` is on `$PATH`.
- **Shared toggles** live in `lua/utils.lua` (spell, cursorcolumn, mouse, autoformat, snippet list). New toggles belong here, not inline in `keymaps.lua`.
- **Filetype overrides** go under `after/ftplugin/<ft>.lua`. Neovim resolves the filename against the buffer's `&filetype`, so a typo silently disables the override.
- **Leader** is space (set in `options.lua` BEFORE plugins load — required by `lazy.nvim`).

## Conventions enforced by tooling

- **StyLua** (`.stylua.toml`): 2-space indent, double quotes preferred, **`call_parentheses = "None"`** — write `require "foo"` not `require("foo")` for single-string-arg calls. Column width 260 (effectively no wrapping). Run `stylua .` or `bash scripts/format.sh`.
- **markdownlint** (`.markdownlint.json`): defaults with `MD013` (line length) disabled.
- **EditorConfig** is honored via `vim-sleuth` at runtime; respect it when editing.
- All Lua plugin files end with `return { ... }` (single spec or list). Match the existing per-file style.

## Verifying changes

There is no automated test suite. To verify a change:

```sh
nvim --headless "+Lazy! sync" +qa     # reconcile plugins + update lockfile
nvim --headless "+checkhealth" +qa    # sanity check (noisy; scan for ERROR)
stylua --check .                       # lint formatting without writing
```

Then open Neovim interactively and exercise the affected feature. For a keymap change, `:Telescope keymaps` (`<leader>fk`) or `:CheckDuplicates` to detect collisions.

## Lockfile workflow

`lazy-lock.json` is committed. Bump plugins by running `:Lazy sync` (or the headless command above) and committing the resulting lockfile diff — do not hand-edit it. When adding a new plugin, the same sync produces the lockfile entry.

## Git conventions (repo-specific)

- `main` requires signed commits (see `SECURITY.md`). Don't push unsigned commits to `main`.
- Conventional Commits style is used in history (`feat:`, `fix:`, …).
