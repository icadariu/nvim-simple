return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "modern" },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer local keymaps",
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.add {
        { "<leader>f", group = "find" },
        { "<leader>b", group = "buffers" },
        { "<leader>X", group = "trouble/diagnostics" },
        { "<leader>s", group = "spell" },
        { "<leader>c", group = "code/copy" },
        { "<leader><Tab>", group = "toggles" },
        { "<leader>u", group = "ui-toggles" },
      }
    end,
  },
}
