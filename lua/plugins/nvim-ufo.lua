return {
  { 'kevinhwang91/promise-async' },
  {
    'kevinhwang91/nvim-ufo',
    event = 'BufReadPost',
    opts = {
      provider_selector = function() return { 'treesitter', 'indent' } end,
    },
    keys = {
      { 'zR',         function() require('ufo').openAllFolds() end,  desc = 'Open all folds' },
      { 'zM',         function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
      -- optional leader versions so which-key shows them:
      { '<leader>zR', function() require('ufo').openAllFolds() end,  desc = 'Open all folds' },
      { '<leader>zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    },
  },
}
