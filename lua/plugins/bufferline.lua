return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
      options = {
        diagnostics = 'nvim_lsp', -- shows nvim-lint diagnostics via vim.diagnostic
        show_buffer_close_icons = false,
        separator_style = 'thin',
      },
    },
  },
}
