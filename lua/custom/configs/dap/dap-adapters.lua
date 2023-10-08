local dap = require "dap"

-------------------------------------------------------------------------------
-- CPP/C
-------------------------------------------------------------------------------
-- codelldb
local cpp_debugger_port = "13000"
dap.adapters.codelldb = {
  name = "codelldb server",
  type = "server",
  port = cpp_debugger_port,
  executable = {
    command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
    args = { "--port", cpp_debugger_port },
  },
}
-- cpptools
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath "data" .. "/mason/bin/OpenDebugAD7",
  options = {
    detached = false
  }
}
