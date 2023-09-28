local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd"
      }
    }
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function ()
      require("auto-save").setup(
        -- your config goes here
        -- or just leave it emptu :)
      )
    end,
  },
  -- 基于LSP的代码结构树
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function ()
      require("symbols-outline").setup(
        require("custom.configs.symbols-outline-config")
      )
    end,
  },
}

return plugins
