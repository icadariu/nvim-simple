-- Disable unused providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Optional: explicitly set Python provider path if you use a venv or custom python
-- vim.g.python3_host_prog = '/usr/bin/python3'

vim.api.nvim_create_user_command("CheckDuplicates", function()
  local modes = { "n", "v", "i", "x", "o" }
  for _, mode in ipairs(modes) do
    local map = vim.api.nvim_get_keymap(mode)
    local seen = {}
    for _, m in ipairs(map) do
      if seen[m.lhs] then
        print("Duplicate in mode " .. mode .. ": " .. m.lhs)
      else
        seen[m.lhs] = true
      end
    end
  end
end, {})

-- add hint at status bar
--vim.api.nvim_create_autocmd("VimEnter", {
--  callback = function()
--    vim.defer_fn(function()
--      vim.cmd [[
--        echohl ModeMsg |
--        echom "Hint: s + letter → Flash jump | <leader>fk → Telescope keymaps" |
--        echohl None
--      ]]
--    end, 500)
--  end,
--})
