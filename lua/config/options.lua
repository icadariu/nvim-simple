vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 200
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ""

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

vim.opt.updatetime = 250 -- Decrease update time

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }


vim.opt.smartindent = true
vim.opt.shiftwidth = 2       -- Size of an indent
vim.opt.textwidth = 200      -- Line size

vim.opt.inccommand = "split" -- Preview substitutions live, as you type!

vim.opt.cursorline = true    -- Show which line your cursor is on
vim.opt.cursorcolumn = false -- Shows cursor vertical position

vim.opt.conceallevel = 0     -- disable cncealment in markdown

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- This option helps to avoid all the |hit-enter| prompts caused by file f.e with Ctrl-G
-- Ctrl-g prints current filename
vim.opt.shortmess:append { W = true, I = true, c = true, C = true }

vim.opt.spelllang = { "en" }
vim.opt.spelloptions:append "noplainbuffer" -- Only spellcheck a buffer when 'syntax' is enabled,

-- fold markdown
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
