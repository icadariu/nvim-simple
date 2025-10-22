return { -- Used to trim new line, empty space, etc
  "cappyzawa/trim.nvim",
  opts = {
    -- Custom configuration for trim.nvim
    ft_blocklist = { 'markdown' }, -- Add any filetypes you don't want to be trimmed
    patterns = {},                 -- Add any additional patterns to trim
    trim_on_write = true,          -- Enable trim on file save (write)
    trim_trailing = true,          -- Trim trailing whitespaces
    trim_last_line = true,         -- Trim the last empty line(s)
    trim_first_line = true,        -- Trim the first empty line(s)
    highlight = true,              -- Disable highlighting of trimmed parts
    highlight_bg = "#ff0000",      -- Customize highlight background color
    highlight_ctermbg = "red",     -- Customize highlight color in terminal mode
  },
}
