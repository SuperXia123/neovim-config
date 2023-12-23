-- 设置代码对齐线
vim.opt.colorcolumn = "81"

-- 控制是否开启blamer
ENABLE_BLAMER = true

-- 对spell-checking进行设置
require "custom.configs.spellchecker-config"

-- 加载workspace文件夹下的各项目独立配置
-- rc路径：${workspace}/.nvim/.nvimrc
-- vim.o.exrc = true  -- see: help exrc
require "custom.helpers.workspace-loader"

-- 进入buf时的配置, 这里的配置会覆写默认配置
require "custom.helpers.bufer-enter-events"

-- 自动读取文件变更
-- 1. trigger `autoread` when files changes on disk
vim.cmd "set autoread"
vim.cmd "autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif"
-- 2. notification after file change
vim.cmd "autocmd FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"

-- neovide配置
if vim.g.neovide then
  require "custom.configs.neovide-config"
end
