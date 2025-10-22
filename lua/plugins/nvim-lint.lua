return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        ansible = { 'ansible_lint' },
        yaml = { 'yamllint' }, -- many Ansible files are yaml; add ansible ft if you use an ftplugin
        dockerfile = { 'hadolint' },
        markdown = { 'markdownlint' },
        terraform = { 'terraform_validate', 'tflint', 'tfsec' },
        json = { 'jsonlint' },
        sh = { 'shellcheck' },
        bash = { 'shellcheck' },
        zsh = { 'zsh' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        callback = function() require('lint').try_lint() end,
      })
    end,
  },
}
