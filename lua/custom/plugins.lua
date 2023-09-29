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
  -- 代码结构树option1
  {
    "simrat39/symbols-outline.nvim",
    enabled = false,
    lazy = false,
    config = function ()
      require("symbols-outline").setup(
        require("custom.configs.symbols-outline-config")
      )
    end,
  },
  -- 代码结构树option2
  {
    "stevearc/aerial.nvim",
    enabled = true,
    lazy = false,
    config = function ()
      require("aerial").setup(
        require("custom.configs.aerial-config")
      )
    end,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  -- 可视化git-blame
  {
    "APZelos/blamer.nvim",
    lazy = false,
  },
}

return plugins
