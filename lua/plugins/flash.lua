return {
  {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- keys work in different modes:
  -- s - normal, visual, operator-pending
  -- R - operator pending or visual (o,x) -> first start motion (yR or dR)
  -- S - command-line (c) -> while typing /,?, or : -> Toggles Flash’s live search highlighting.
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}
}
