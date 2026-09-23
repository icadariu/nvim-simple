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
      }

      lint.linters_by_ft = {}
      for ft, linters in pairs(desired) do
        local present = {}
        for _, name in ipairs(linters) do
          -- linter name != binary (terraform_validate -> terraform, ansible_lint -> ansible-lint)
          local linter = lint.linters[name]
          if type(linter) == "function" then
            linter = linter()
          end
          local cmd = type(linter.cmd) == "function" and linter.cmd() or linter.cmd
          if vim.fn.executable(cmd) == 1 then
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
