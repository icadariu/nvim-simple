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
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = {}, -- no formatter
        terraform = { "terraform_fmt" },
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
