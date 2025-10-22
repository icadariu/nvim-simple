# Good to know

## Shortcuts

* Check custom keymaps [here](../lua/configs/keymaps.lua) will help.
* Disable format using `<leader>uf`

## Tips & Tricks

* `Alt+h/l` in insert mode - move cursor left or right.
* `Alt+j/k` in insert mode - move cursor line up/down.
* `Ctrl+y` accept autocomplete suggestions.

* Using `s` will activate `flash` plugin, allowing fast movement inside the code.

* Check available custom keymaps using whichkey plugin:
  * Using `<leader>?`
  * Using Telescope search keymaps - `<leader>sk`

* **Diagnostics**
  * `[d or ]d` - jump between identified issues

* **Marks**
  * view marks: `:marks`
  * add mark: `ma` (or any letter after character after "m")
  * delete mark: `:delm mymark` or `:delm!` to delete everything

* **Folding**
  * Default shortcuts (credits to [this](https://itnext.io/better-kubernetes-yaml-editing-with-neo-vim-af7da9a1b150))

    ```txt
    za - Toggle fold under cursor
    zA - Toggle all folds under cursor
    zc - Close fold under cursor
    zC - Close all folds under cursor
    zd - Delete fold under cursor
    zD - Delete all folds in file
    zf - Create fold
    zo - Open fold under cursor
    zO - Open all folds under cursor
    zm - Fold more (close more folds)
    zM - Close all folds
    zr - Fold less (open more folds)
    zR - Open all folds
    zx - Update folds
    zX - Reapply folds
    ```

  * Folding links
    * <https://www.youtube.com/watch?v=f_f08KnAJOQ>
    * <https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/>

* Spelling built-in shortcuts.

  ```vim
  :set spell – Turn on spell checking
  :set nospell – Turn off spell checking
  ]s – Jump to the next misspelled word
  [s – Jump to the previous misspelled word
  z= – Bring up the suggested replacements
  zg – Good word: Add the word under the cursor to the dictionary
  zw – Woops! Undo and remove the word from the dictionary
  ```

* Check available autocomands that will be executed on `BufWritePre` before file is saved:

  ```vim
  :verbose autocmd BufWritePre
  ```

* Add verbosity to check what will happen during an event (ex: when pressing save)

  ```vim
  :set verbose=15
  ```

* Can be useful to check what script changed your file
* For more advanced debugging - log all actions taken during a session

  ```sh
  nvim -V10logfile
  ```
