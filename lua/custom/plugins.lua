-- LSP
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- 加载lsp的key-mapping
      require("core.utils").load_mappings "lspconfig"

      require("mason-lspconfig").setup {
        ensure_installed = { "clangd" },
      }

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        -- ["clangd"] = function()
        --   require("lspconfig").clangd.setup {}
        -- end,
      }
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
        -- or just leave it empty :)
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
      require("diffview").setup(require "custom.configs.diffview-config")
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
    "SuperXia123/nvim-dap-virtual-text",
    -- "theHamsta/nvim-dap-virtual-text"
    init = function()
      require("nvim-dap-virtual-text").setup(require "custom.configs.dap.dap-virtual-text")
    end,
  },
  -- runner
  {
    "SuperXia123/runner.nvim",
    -- "MarcHamamji/runner.nvim",
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
  {
    "zbirenbaum/neodim",
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

  -----------------------------------------------------------------------------
  -- 以下为暂时关闭的插件
  -----------------------------------------------------------------------------
  -- 代码结构树option1
  {
    "simrat39/symbols-outline.nvim",
    enabled = true,
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
