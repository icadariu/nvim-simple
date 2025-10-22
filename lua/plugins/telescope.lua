return {
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    cmd = 'Telescope',
    opts = {
      defaults = {
        mappings = { i = { ['<C-k>'] = 'move_selection_previous', ['<C-j>'] = 'move_selection_next' } },
      },
    },
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') ==
              1
        end
      },
    },
    config = function(_, opts)
      local t = require('telescope')
      t.setup(opts)
      pcall(t.load_extension, 'fzf')
    end,
  },
}
