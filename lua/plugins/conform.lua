-- lua/plugins/conform.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo", "Format" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format { async = true }
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(buf)
        if vim.g.disable_autoformat or vim.b[buf].disable_autoformat then
          return
        end
        -- do not autoformat zsh
        if vim.bo[buf].filetype == "zsh" then
          return
        end
        return { timeout_ms = 1500, lsp_fallback = false }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", "markdownlint", stop_after_first = true },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = {}, -- no formatter
        terraform = vim.fn.executable "terraform" == 1 and { "terraform_fmt" } or nil,
      },
      -- optional: configure shfmt (uncomment to force 2-space indent)
      -- formatters = {
      --   shfmt = {
      --     prepend_args = { "-i", "2" }, -- 2 spaces per indent
      --   },
      -- },
    },
  },
}
