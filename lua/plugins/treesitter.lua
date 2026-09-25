return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main branch does not support lazy-loading
    cond = vim.fn.has "nvim-0.12" == 1, -- main branch requires Neovim >= 0.12; skip instead of erroring on older versions
    build = ":TSUpdate",
    dependencies = { "williamboman/mason.nvim" }, -- tree-sitter-cli comes from mason/bin
    config = function()
      local function install()
        require("nvim-treesitter").install {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "dockerfile",
          "terraform",
          "hcl",
        }
      end
      -- check mason's copy: a distro tree-sitter on PATH (e.g. apt 0.20) is too old for the main branch
      if vim.fn.executable(vim.fn.stdpath "data" .. "/mason/bin/tree-sitter") == 1 then
        install()
      else
        -- first run: wait for mason-tool-installer to provide tree-sitter-cli
        vim.api.nvim_create_autocmd("User", { pattern = "MasonToolsUpdateCompleted", once = true, callback = install })
      end
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          if not pcall(vim.treesitter.start, args.buf) then
            return
          end
          if vim.bo[args.buf].filetype ~= "yaml" then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
