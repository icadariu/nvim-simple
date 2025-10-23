return {
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find files' },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Live grep' },
      { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Buffers' },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Help tags' },
      { '<leader>fk', function() require('telescope.builtin').keymaps() end,    desc = 'Keymaps' }, -- ← add this
      { '<leader>fc', function() require('telescope.builtin').commands() end,   desc = 'Commands' }, -- optional
    },
    opts = {
      defaults = {
        mappings = { i = { ['<C-k>'] = 'move_selection_previous', ['<C-j>'] = 'move_selection_next' } },
      },
    },
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = function() return vim.fn.executable('make') == 1 end },
    },
    config = function(_, opts)
      local t = require('telescope')
      t.setup(opts)
      pcall(t.load_extension, 'fzf')
    end,
  },
}
