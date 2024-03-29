-- LSP
local plugins = {
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "custom.configs.lspconfig"
  --   end,
  -- },
  require "custom.plugins.lsp.mason-lspconfig",
  require "custom.plugins.formatter.formatter",
  require "custom.plugins.auto-save.auto-save",
  require "custom.plugins.buffer-manager.buffer_manager",
  -- 可视化git-blame
  { "nvim-neotest/nvim-nio" },  -- requirement of dap-ui
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
      require("diffview").setup(require "custom.configs.diffview-config")
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
  -- require "custom.plugins.dap.nvim-dap",
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
    "SuperXia123/nvim-dap-virtual-text",
    -- "theHamsta/nvim-dap-virtual-text"
    init = function()
      require("nvim-dap-virtual-text").setup(require "custom.configs.dap.dap-virtual-text")
    end,
  },
  -- runner
  {
    "dasupradyumna/launch.nvim",
    -- add below plugins as per user requirement
    enabled = false,
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-notify",
    },
    opts = {},
  },
  {
    "folke/noice.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    config = function()
      require("noice").setup(require "custom.configs.noice-config")
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "SuperXia123/runner.nvim",
    -- "MarcHamamji/runner.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    init = function()
      require("core.utils").load_mappings "runner"
      require "custom.configs.coderunner"
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    init = function()
      require "custom.configs.illuminate-config"
    end,
  },
  {
    "gelguy/wilder.nvim",
    init = function()
      require("wilder").setup {
        modes = { ":", "/", "?" },
      }
      require "custom.configs.wilder-config"
    end,
  },
  -- multi-cursor
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
      vim.cmd "VMTheme neon"
    end,
  },
  {
    "github/copilot.vim",
    enabled = false,
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    init = function()
      local codewindow = require "codewindow"
      codewindow.setup(require "custom.configs.codewindow-config")
      codewindow.apply_default_keybinds()
    end,
  },
  require "custom.plugins.scroll-bar.nvim-scrollbar",
  {
    "ahmedkhalf/project.nvim",
    init = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {}
    end,
  },
  {
    "willothy/flatten.nvim",
    enabled = false,
    config = true,
    -- or pass configuration with
    -- opts = {  }
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
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
  {
    "lewis6991/satellite.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("satellite").setup(require "custom.configs.satellite-config")
    end,
  },
  {
    "zbirenbaum/neodim",
    enabled = false,
    event = "LspAttach",
    config = function()
      require("neodim").setup {
        refresh_delay = 1,
        alpha = 0.7,
        blend_color = "#000000",
        hide = {
          underline = true,
          virtual_text = true,
          signs = true,
        },
        regex = {
          "[uU]nused",
          "[nN]ever [rR]ead",
          "[nN]ot [rR]ead",
        },
        priority = 128,
        disable = {},
      }
    end,
  },
  require "custom.plugins.cursor-motion.flash",
}

return plugins
