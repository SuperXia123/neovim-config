-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--------------------------------------------------------------------------------
-- Utils function definition
--------------------------------------------------------------------------------
local utils = {}
function utils.get_visual_selection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  text = string.gsub(text, " ", "\\ ")
  if #text > 0 then
    return text
  else
    return ""
  end
end

--------------------------------------------------------------------------------
-- GENERAL
--------------------------------------------------------------------------------
local map = vim.keymap.set
-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- better moves
map("n", "j", "jzz", { desc = "move down" })
map("n", "k", "kzz", { desc = "move down" })

--------------------------------------------------------------------------------
-- TERMINAL
--------------------------------------------------------------------------------
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
map("n", "<a-i>", lazyterm, { desc = "Floating terminal (root dir)" })
map("t", "<a-i>", lazyterm, { desc = "Floating terminal (root dir)" })

--------------------------------------------------------------------------------
-- PASTE SHORTCUT
--------------------------------------------------------------------------------
map("i", "<C-v>", "<C-r>+", { desc = "Paste in insert mode" })
map("c", "<C-v>", "<C-r>+", { desc = "Paste in command mode" })
-- map("t", "<C-v>", "<C-r>+", { desc = "Paste in terminal mode" })

--------------------------------------------------------------------------------
-- TELESCOPE
--------------------------------------------------------------------------------
-- find project
map("n", "<leader>fp", "<cmd> Telescope projects <CR>", { desc = "Find project" })
-- find files
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find file" })
-- find old-files
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfile" })
-- find word
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Find word" })
map("v", "<leader>fw", function()
  vim.cmd("Telescope grep_string default_text=" .. utils.get_visual_selection())
end, { desc = "Find word" })
-- symbols outline
map("n", "<F12>", function()
  vim.cmd("Telescope lsp_document_symbols symbol_width=60 show_line=false")
end, { desc = "List document symbols" })

--------------------------------------------------------------------------------
-- NEOTREE
--------------------------------------------------------------------------------
map("n", "<A-1>", "<cmd> Neotree toggle <CR>", { desc = "Toggle file explorer" })

--------------------------------------------------------------------------------
-- BUFFER MANAGER
--------------------------------------------------------------------------------
local function open_buffer_manager()
  require("buffer_manager.ui").toggle_quick_menu()
end
map("n", "<leader>bm", open_buffer_manager, { desc = "Buffer manager" })

--------------------------------------------------------------------------------
-- DAP
--------------------------------------------------------------------------------
-- breakpoint
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle debug breakpoint" })
-- start/continue debugger
map("n", "<F9>", "<cmd> DapContinue <CR>", { desc = "Start/Continue the debugger" })
-- terminate debug
map("n", "<leader>dt", function()
  vim.cmd("DapTerminate")
  require("dapui").close()
  vim.cmd("DapVirtualTextForceRefresh")
end, { desc = "Terminate the debug" })
-- step over
map("n", "<F8>", "<cmd> DapStepOver <CR>", { desc = "Debug step over" })
-- step into
map("n", "<F7>", "<cmd> DapStepInto <CR>", { desc = "Debug step into" })
-- hover window to evaluate expression
map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "Evaluate the variable under cursor" })
