# Things worth mentioning

- This is a simple nvim setup, based on my primary configuration.

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
