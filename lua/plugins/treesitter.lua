return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'lua', 'vim', 'vimdoc', 'bash', 'json', 'yaml', 'markdown', 'markdown_inline',
        'dockerfile', 'terraform', 'hcl'
      },
    },
  },
}
