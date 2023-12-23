function SearchSymbols()
  vim.cmd "Telescope lsp_document_symbols symbol_width=60 show_line=false"
end

function TerminateDebug()
  -- close dap-virtual-text
  vim.cmd "DapVirtualTextExit"
  -- close dap
  vim.cmd "DapTerminate"
  -- close dap-ui
  require("dapui").close()
  -- recover blamer status
  vim.g.blamer_enabled = ENABLE_BLAMER
end

local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  --   n = {
  --       ["<leader>h"] = "",
  --       ["<C-a>"] = ""
  --   }
}

-- Your custom mappings
M.abc = {
  n = {
    -- 使用telescope搜索文件大纲
    -- about symbols_width and show_line see:
    -- https://www.reddit.com/r/neovim/comments/13f425s/help_needed_with_telescopebuiltinlsp_document/
    ["<F12>"] = { ":lua SearchSymbols() <CR>", "symbols outline" },
    ["j"] = { "jzz", "jump down and focus", opts = { nowait = true } },
    ["k"] = { "kzz", "jump up and focus", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

M.neovide = {
  n = {
    ["<F11>"] = { ":lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen <CR>", "neovide fullscreen" },
  },
}

M.dap = {
  -- only works when they are explicitly loaded
  plugin = true,
  n = {
    -- 打断点
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    -- 开始/继续调试
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<F9>"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    -- 结束调试
    ["<leader>dt"] = {
      ":lua TerminateDebug() <CR>",
      "Terminate the debugger",
    },
    -- 步进
    ["<F8>"] = {
      "<cmd> DapStepOver <CR>",
      "Debug step over",
    },
    -- 进入函数
    ["<F7>"] = {
      "<cmd> DapStepInto <CR>",
      "Debug step into",
    },
  },
  i = {},
  v = {},
}

M.runner = {
  -- only works when they are explicitly loaded
  plugin = true,
  n = {
    ["<F10>"] = {
      "<cmd> Runner <CR>",
      "Run code",
    },
  },
  i = {},
  v = {},
}

function OpenBufferManager()
  require("buffer_manager.ui").toggle_quick_menu()
end
M.buffer_manager = {
  plugin = true,
  n = {
    ["<C-Tab>"] = { ":lua OpenBufferManager() <CR>", "Manage buffers" },
  },
  i = {
    ["<C-Tab>"] = { ":lua OpenBufferManager() <CR>", "Manage buffers" },
  },
}

return M
