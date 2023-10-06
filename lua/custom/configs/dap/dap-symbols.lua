vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#db5c5c", bg = "" })
vim.api.nvim_set_hl(0, "DapBreakLine", { ctermbg = 0, fg = "", bg = "#4b1515"})
vim.api.nvim_set_hl(0, "DapStoppedLine", { ctermbg = 0, fg = "", bg = "#264b33" })

local brealpoint_symbol = ""

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
vim.fn.sign_define(
  "DapLogPoint",
  { text = "", texthl = "DapBreakpoint", linehl = "DapBreakLine", numhl = "" }
)
vim.fn.sign_define(
  "DapStopped", 
  { text = "", texthl = "DapBreakpoint", linehl = "DapStoppedLine", numhl = "" }
)
