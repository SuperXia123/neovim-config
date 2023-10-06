-- 负责配置dap命中/退出断点后的事件和环境切换
local dapui = require "dapui"
local dap = require "dap"

local function close_nvim_tree()
  vim.cmd "NvimTreeClose"
end
local raw_blamer_status = vim.g.blamer_enabled

-- 命中后事件
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.g.blamer_enabled = 0
  pcall(close_nvim_tree)
end

-- 退出调试事件
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.g.blamer_enabled = raw_blamer_status
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.g.blamer_enabled = raw_blamer_status
end
