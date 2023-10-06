local dap = require "dap"

-- cpp
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
