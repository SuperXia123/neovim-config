-- This file provides some templates for dap configurations, 
-- which should be placed at workspace root directory so that configurations
-- could be loaded project-wise.

local dap = require("dap")

--------------------------------------------------------------------------------
-- CPP
--------------------------------------------------------------------------------
dap.configurations.cpp = {
  -- codelldb
	{
		name = "Playground",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/build/Playground"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
		setupCommands = {
			{
				descriptions = "enable pretty printing",
				text = "-enable-pretty-printing",
				ignoreFailsures = false,
			},
		},
	},
  -- cppdbg, gdb
	{
		name = "cppdbg",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/build/Playground"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

--------------------------------------------------------------------------------
-- Python
--------------------------------------------------------------------------------
