# Maintenance & Configuration Guide

This guide explains how to maintain and customize your Neovim setup.

## 1. Updating Plugins

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

- **Open Lazy UI**: Press `<leader>l` (or type `:Lazy`).
- **Update Plugins**: Inside the Lazy UI, press `U` to check for updates and `u` to update.
- **Syncing (CLI)**: You can also sync from the terminal:

  ```sh
  nvim --headless "+Lazy! sync" +qa
  ```

- **Check Health**: Run `:checkhealth` to see if there are any issues with your setup or dependencies.

## 2. Changing the Theme

Colorschemes are managed in `lua/plugins/color_themes.lua`.

1. **Add a theme**: Add the plugin to the return table:

   ```lua
   { "folke/tokyonight.nvim", lazy = true },
   ```

2. **Set as default**: Move your preferred theme to the top and set its `config` to call `vim.cmd.colorscheme "your-theme"`.
3. **Ghostty Sync**: If you want Neovim to match your Ghostty terminal, ensure the colorscheme is installed and activated (like Gruvbox is now).

## 3. Basic Configuration Structure

- `init.lua`: The entry point. Handles basic provider settings and initializes the plugin manager.
- `lua/config/`:
  - `options.lua`: Standard Vim/Neovim options (`vim.opt`).
  - `keymaps.lua`: Custom keybindings and shortcuts.
  - `global.lua`: Global variables and miscellaneous commands.
- `lua/plugins/`: Individual files for plugin-specific configurations.
- `lua/utils.lua`: Shared utility functions (like toggles).

## 4. Toggling Features

We've implemented several toggles for a cleaner experience:

- `<leader>uf`: Toggle **auto-formatting** on save.
- `<leader><Tab>ts`: Toggle **spell check**.
- `<leader><Tab>tm`: Toggle **mouse support**.
- `<leader><Tab>tc`: Toggle **cursor column**.

## 5. Formatting & Linting

- **Format current buffer**: `<leader>cf`.
- **Formatting status**: Trailing whitespace is automatically trimmed on save unless auto-format is toggled off (`<leader>uf`).
- **Linters**: Linters run automatically on save (YAML, Docker, Markdown, etc.).
