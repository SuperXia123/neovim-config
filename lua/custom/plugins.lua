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
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it emptu :)
      }
    end,
  }
}

return plugins
