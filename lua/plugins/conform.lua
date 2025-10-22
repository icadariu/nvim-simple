return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
      notify_on_error = false,
      format_on_save = function(buf)
        if vim.g.disable_autoformat or vim.b[buf].disable_autoformat then return end
        return { timeout_ms = 1500, lsp_fallback = false }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        json = { 'jq' }, -- simple formatter; switch to 'prettierd' if you prefer
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        terraform = { 'terraform_fmt' },
      },
    },
  },
}
