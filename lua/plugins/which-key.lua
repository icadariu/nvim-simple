return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = { preset = 'modern' },
    keys = {
      {
        '<leader>?',
        function() require('which-key').show({ global = false }) end,
        desc = 'Buffer local keymaps',
      },
    },
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.add({
        { '<leader>f', group = 'find' },
        { '<leader>b', group = 'buffers' },
        { '<leader>x', group = 'diagnostics' },
      })
    end,
  },
}
