return {
  {
    "williamboman/mason.nvim",
    lazy = false, -- setup prepends mason/bin to PATH; conform/nvim-lint need it before first format
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false, -- installs are triggered on VimEnter; VeryLazy fires after it, so nothing was ever installed
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "prettierd",
        "shfmt",
        "stylua",
        "tree-sitter-cli",
        "yamlfmt",
      },
    },
  },
}
