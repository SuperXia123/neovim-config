local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "stylua",
      },
    },
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup(
        -- your config goes here
        -- or just leave it emptu :)
      )
    end,
  },
  -- 可视化git-blame
  {
    "APZelos/blamer.nvim",
    lazy = false,
    init = function()
      require "custom.configs.blamer-config"
    end,
  },
  -- 独立标签页显示本地所有修改/文件历史修改
  {
    "sindrets/diffview.nvim",
    init = function()
      require("diffview").setup()
    end,
  },
  -- formatter
  {
    "mhartington/formatter.nvim",
    lazy = false,
    init = function()
      require("formatter").setup(require "custom.configs.formatter-config")
    end,
  },
  -- Debug插件1: DAP(Debug Adaptor Protocal)
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
      require "custom.configs.dap.dap-config"
    end,
  },
  -- Debug插件2: 用于debug时的展示窗
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dapui").setup()
      require "custom.configs.dap.dap-ui-config"
    end,
  },
  -- Debug插件3: 用于debug时代码侧文字显示
  {
    "theHamsta/nvim-dap-virtual-text",
  },

  -----------------------------------------------------------------------------
  -- 以下为暂时关闭的插件
  -----------------------------------------------------------------------------
  -- 代码结构树option1
  {
    "simrat39/symbols-outline.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("symbols-outline").setup(require "custom.configs.symbols-outline-config")
    end,
  },
  -- 代码结构树option2
  {
    "stevearc/aerial.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("aerial").setup(require "custom.configs.aerial-config")
    end,
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- 光标旁小窗显示完整commit信息
  {
    "rhysd/git-messenger.vim",
    enabled = false,
    lazy = false,
  },
}

return plugins
