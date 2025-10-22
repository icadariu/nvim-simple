return {
  { 'kevinhwang91/promise-async' },
  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    opts = {
      provider_selector = function() return { 'treesitter', 'indent' } end,
      open_fold_hl_timeout = 100,
    },
  },
}
