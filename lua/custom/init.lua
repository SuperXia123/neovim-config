-- 设置代码对齐线
vim.opt.colorcolumn = "80"

-- 控制是否开启blamer
ENABLE_BLAMER = true

-- 对spell-checking进行设置
require "custom.configs.spellchecker-config"

-- 加载workspace文件夹下的各项目独立配置
-- rc路径：${workspace}/.nvim/.nvimrc
-- vim.o.exrc = true  -- see: help exrc
require "custom.helpers.workspace-loader"

-- 进入buf时的配置, 这里的配置会覆写默认配置
require "custom.helpers.configs-on-buf-enter"
