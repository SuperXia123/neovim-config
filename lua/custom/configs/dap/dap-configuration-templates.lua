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
		name = "launch",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/output/ndm_envmodel/ndm_envmodel"
		end,
		cwd = "${workspaceFolder}/output/ndm_envmodel",
		environment = {
			{ name = "LD_LIBRARY_PATH", value = "./lib/auto_common_lib" },
		},
		stopOnEntry = false,
		args = { "-c", "./config/dataflow/ndm_envmodel_process.json", "-w", "./" },
		runInTerminal = true,
	},
}

--------------------------------------------------------------------------------
-- Python
--------------------------------------------------------------------------------
