function GetVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  text = string.gsub(text, " ", "\\ ")
  if #text > 0 then
    return text
  else
    return ""
  end
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
    ["<F12>"] = {
      function()
        vim.cmd "Telescope lsp_document_symbols symbol_width=60 show_line=false"
      end,
      "Symbols outline",
    },
    -- 使用telescope搜索上一个query
    ["<leader>fl"] = {
      function()
        require("telescope.builtin").resume()
      end,
      "Find last query",
    },
    ["<leader>fp"] = {
      function()
        vim.cmd "Telescope projects"
      end,
      "Search projects",
      opts = { noremap = true, silent = true },
    },
    -- jk移动屏幕自动聚焦中间
    ["j"] = { "jzz", "jump down and focus", opts = { nowait = true } },
    ["k"] = { "kzz", "jump up and focus", opts = { nowait = true } },
  },

  v = {
    -- see ref: https://www.reddit.com/r/neovim/comments/p8wtmn/comment/i7jubzh/?utm_source=share&utm_medium=web2x&context=3
    -- ["<leader>fw"] = {
    --   "\"zy<cmd>exec 'Telescope live_grep default_text=' . escape(@z, ' ')<cr>",
    --   "search selected content",
    --   opts = { noremap = true, silent = true },
    -- },
    -- see ref: https://github.com/nvim-telescope/telescope.nvim/issues/1923#issuecomment-1123136065
    ["<leader>fw"] = {
      function()
        vim.cmd("Telescope grep_string default_text=" .. GetVisualSelection())
      end,
      "search selected content",
      opts = { noremap = true, silent = true },
    },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-v>"] = { "<C-r>+", "Paste in insert mode", { noremap = true } },
  },

  t = {
    ["<C-v>"] = { "<C-\\><C-n>pa ", "Paste in terminal mode", { noremap = true } },
  },

  c = { ["<C-v>"] = { "<C-r>+", "Paste in insert mode", { noremap = true } } },
}

M.copilot = {
  i = {
    ["<C-q>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
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
