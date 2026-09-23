# Things worth mentioning

- This is a simple nvim setup, based on my primary configuration.

## [2026-09-23] Config review fixes

- **Fixed**: `mason.nvim` now loads at startup, so conform finds `stylua`/`prettierd`/`yamlfmt` (format-on-save was a silent no-op).
- **Fixed**: `nvim-treesitter` configured for the `main` branch API; parsers install and highlighting starts via `FileType` autocmd.
- **Fixed**: nvim-lint detects linters by binary (`terraform_validate`, `ansible_lint` now register); shellcheck no longer runs on zsh.
- **Keymaps**: Copy File Name `<leader>cf` -> `<leader>cn`; select-all `==` -> `<leader>a`; new `<leader>e` for `mini.files`; insert-mode `<A-j>`/`<A-k>` fixed.
- **Removed**: `:CheckDuplicates` (use `:checkhealth which-key`) and the unused snippet list helper.
- **Changed**: yamlfmt no longer prepends `---`; trim-on-save honors the autoformat toggle and skips markdown/diff.

## [2026-04-15] Optimization & Cleanup

- **Cleaned up redundant plugins**:
  - Removed `nvim-autopairs` (replaced by `mini.pairs`).
  - Removed `comment-nvim` (replaced by Neovim 0.10+ native commenting).
  - Removed `trim-nvim` (replaced by native autocommand).
- **Consolidated Configuration**:
  - Moved toggle functions (Spell, Mouse, Cursor) to a central `lua/utils.lua` module.
  - Refactored `keymaps.lua` to be cleaner and use the new `utils` module.
  - Optimized `init.lua` for better performance and robust setup.
- **Improved Security**: Ensured explicit lockfile usage and added plugin update checking.
