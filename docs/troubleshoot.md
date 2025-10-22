# Troubleshooting Neovim

* <https://www.youtube.com/watch?v=lyNfnI-B640>
* Activating debug mode:

  ```vim
  :set verbosefile=~/.config/nvim/nvim.log
  :set verbose=3
  ```

* check lsp log - `~/.local/state/nvim/lsp.log`
* Or do something like:

  ```txt
  :lua vim.diagnostic.setqflist():q

  # open the issues using
  :copen

  ```

* Why my values got changed?

  ```markdown
  *  Let's say we have shiftwidth tabstop softtabstop set to 2
  * We can check this by using
  :set shiftwidth? tabstop? softtabstop? expandtab?
  ```

  * While editing a markdown file, these have been changed to 4.
  * To check which plugin interacted with the file, use the following

    ```vim
    :verbose set shiftwidth?
    shiftwidth=2
        Last set from ~/.local/share/nvim/lazy/vim-sleuth/plugin/sleuth.vim line 667
    ```

  * There are couple of ways to deal with it:
    * Check if the plugin is checking coding styles like `.editorconfig`, in this case `vim-sleuth` does it!
    * Create autocmd like:

      ```lua
      -- makrdown filetype changes indentation
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.bo.shiftwidth = 2
          vim.bo.tabstop = 2
          vim.bo.softtabstop = 2
          vim.bo.expandtab = true
        end,
      })
      ```

    * To check different indents temporarily, one can do something like:

      ```vim
      :set ts=2 sts=2 et
      gg=G
      ```
