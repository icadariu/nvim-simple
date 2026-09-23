-- utils.lua
local M = {}

function M.toggle_spell_check()
  vim.opt_local.spell = not vim.opt_local.spell:get()
  print("Spell check: " .. (vim.opt_local.spell:get() and "On" or "Off"))
end

function M.toggle_cursor_column()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

function M.toggle_mouse()
  if vim.o.mouse == "a" then
    vim.o.mouse = ""
    print "Mouse disabled"
  else
    vim.o.mouse = "a"
    print "Mouse enabled"
  end
end

function M.toggle_autoformat()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("Autoformat on save: " .. (vim.g.disable_autoformat and "Disabled" or "Enabled"))
end

return M
