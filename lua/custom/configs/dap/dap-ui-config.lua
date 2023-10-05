local dapui = require "dapui"
local dap = require "dap"

local raw_blamer_status = vim.g.blamer_enabled
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.g.blamer_enabled = 0
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.g.blamer_enabled = raw_blamer_status
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.g.blamer_enabled = raw_blamer_status
end
