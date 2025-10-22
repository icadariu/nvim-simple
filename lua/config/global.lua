-- Define a global function for toggling spell check
_G.toggle_spell_check = function()
  vim.opt_local.spell = not vim.opt_local.spell:get()

  if vim.opt_local.spell:get() then
    vim.opt_local.spelllang = { "en_us" }
    -- Apply 'SpellBad' highlight group to make misspelled words more visible (e.g., red with underlining)
    vim.cmd [[highlight SpellBad guifg=#FF0000 gui=undercurl]]
    print "Spell check: On"
  else
    -- Clear 'SpellBad' highlight group when spell check is off to remove the red color
    vim.cmd [[highlight clear SpellBad]]
    -- Optionally, reset 'SpellBad' to a neutral or invisible state when spell check is off
    vim.cmd [[highlight SpellBad guifg=None gui=None]]
    print "Spell check: Off"
  end
end

-- Global function to toggle cursor column
_G.ToggleCursorColumn = function()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

-- Global function to toggle mouse
_G.ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.o.mouse = ""
    print "Mouse disabled"
  else
    vim.o.mouse = "a"
    print "Mouse enabled"
  end
end
