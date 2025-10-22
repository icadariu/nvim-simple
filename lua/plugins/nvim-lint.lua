return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        yaml = { 'yamllint' },
        ansible = { 'ansible_lint' },
        dockerfile = { 'hadolint' },
        markdown = { 'markdownlint' },
        terraform = { 'tflint', 'tfsec', 'terraform_validate' },
        json = { 'jsonlint' },
        sh = { 'shellcheck' },
        bash = { 'shellcheck' },
        zsh = { 'shellcheck' }, -- 'zsh' linter rarely installed; use shellcheck
      }

      -- Run lint only when filetype has a configured linter
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        callback = function()
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
