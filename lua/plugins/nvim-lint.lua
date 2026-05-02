return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require "lint"

      local desired = {
        yaml = { "yamllint" },
        ansible = { "ansible_lint" },
        dockerfile = { "hadolint" },
        markdown = { "markdownlint" },
        terraform = { "tflint", "tfsec", "terraform_validate" },
        json = { "jsonlint" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        zsh = { "shellcheck" },
      }

      lint.linters_by_ft = {}
      for ft, linters in pairs(desired) do
        local present = {}
        for _, name in ipairs(linters) do
          if vim.fn.executable(name) == 1 then
            table.insert(present, name)
          end
        end
        if #present > 0 then
          lint.linters_by_ft[ft] = present
        end
      end
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
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
