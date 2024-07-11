-- launch.lua配置样例。
-- 将此文件置于项目根目录下.nvim文件夹中, 并在nvimrc.lua中引用
require("dap").configurations.cpp = {
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
			{ name = "TCMALLOC_SAMPLE_PARAMETER", value = "524288" },
		},
		stopOnEntry = true,
		args = { "-c", "./config/dataflow/ndm_envmodel_process.json", "-w", "./" },
		runInTerminal = false,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
