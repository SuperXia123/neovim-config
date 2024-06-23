--------------------------------------------------------------------------------
-- Config symbols
--------------------------------------------------------------------------------
local function config_symbols()
  vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#db5c5c", bg = "" })
  vim.api.nvim_set_hl(0, "DapBreakLine", { ctermbg = 0, fg = "", bg = "#4b1515" })
  vim.api.nvim_set_hl(0, "DapStoppedLine", { ctermbg = 0, fg = "", bg = "#264b33" })
  local brealpoint_symbol = ""
  vim.fn.sign_define(
    "DapBreakpoint",
    { text = brealpoint_symbol, texthl = "DapBreakpoint", linehl = "DapBreakLine", numhl = "" }
  )
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = brealpoint_symbol, texthl = "DapBreakpoint", linehl = "DapBreakLine", numhl = "" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = brealpoint_symbol, texthl = "DapBreakpoint", linehl = "DapBreakLine", numhl = "" }
  )
  vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpoint", linehl = "DapBreakLine", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DapBreakpoint", linehl = "DapStoppedLine", numhl = "" })
end

--------------------------------------------------------------------------------
-- Config adapters
--------------------------------------------------------------------------------
local function config_adapter_cpp()
  local dap = require("dap")
  -- codelldb
  local cpp_debugger_port = "13000"
  dap.adapters.codelldb = {
    name = "codelldb server",
    type = "server",
    port = cpp_debugger_port,
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
      args = { "--port", cpp_debugger_port },
    },
  }
  -- cpptools
  dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
    options = {
      detached = false,
    },
  }
end

return {
  "mfussenegger/nvim-dap",
  config = function()
    config_symbols()
    config_adapter_cpp()
  end,
}
