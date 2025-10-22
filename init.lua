vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- optional: pin python host if you use a venv
-- vim.g.python3_host_prog = '/usr/bin/python3'

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim", "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

require "config.options"
require "config.keymaps"
require "config.global"

require("lazy").setup("plugins", {
  change_detection = { notify = false },
  install = { colorscheme = { "habamax" } },
})

-- set default theme
vim.cmd.colorscheme "habamax"
