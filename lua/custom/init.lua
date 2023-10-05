-- 设置代码对齐线
vim.opt.colorcolumn = "80"

-- 对spell-checking进行设置
require("custom.configs.spellchecker-config")

-- 使能加载workspace文件夹下的rc文件
-- 每个项目有独立的dap.configuration运行配置
-- 参考 :help exrc
vim.o.exrc = true

