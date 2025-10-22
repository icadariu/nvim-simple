return {
  {
    'echasnovski/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup({})
      require('mini.files').setup({})
      require('mini.pairs').setup({})

      require('mini.surround').setup({
        mappings = {
          add = 'gsa',
          delete = 'gsd',
          find = 'gsf',
          find_left = 'gsF',
          highlight = 'gsh',
          replace = 'gsr',
          update_n_lines = 'gsn',
        },
      })
    end,
  },
}
