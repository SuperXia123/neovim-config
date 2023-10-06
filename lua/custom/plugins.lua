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
    command = "DiffViewOpen",
    init = function()
      require("diffview").setup()
    end,
  },
  -- formatter
  {
    "mhartington/formatter.nvim",
    command = "Format",
    init = function()
      require("formatter").setup(require "custom.configs.formatter-config")
    end,
  },
  -- DAP(Debug Adaptor Protocal)相关
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
      require "custom.configs.dap.dap-adapters"
      require "custom.configs.dap.dap-symbols"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dapui").setup()
      require "custom.configs.dap.dap-events"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    init = function()
      require("nvim-dap-virtual-text").setup(require "custom.configs.dap.dap-virtual-text")
    end,
  },
  -- runner
  {
    "MarcHamamji/runner.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    init = function()
      require("custom.configs.coderunner")
    end,
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
