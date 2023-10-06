-- 设置代码对齐线
vim.opt.colorcolumn = "80"

-- 对spell-checking进行设置
require "custom.configs.spellchecker-config"

-- 加载workspace文件夹下的各项目独立配置
-- rc路径：${workspace}/.nvim/.nvimrc
-- vim.o.exrc = true  -- see: help exrc
local function load_workspace_rc ()
  local raw_package_path = package.path
  -- ${workspace}/.nvim文件夹下所有.lua文件加入package路径
  local rc_file = vim.fn.getcwd().."/.nvim/?.lua"
  package.path = package.path..";"..rc_file
  -- 引入rc文件
  require("nvimrc")
  -- 还原package.path
  package.path = raw_package_path
end

FLAG_WORKSPACE_RC_LOADED = false
local function load_workspace_rc_once()
  if FLAG_WORKSPACE_RC_LOADED then
    return
  end
  pcall(load_workspace_rc)
  FLAG_WORKSPACE_RC_LOADED = true
end

local load_rc_group = vim.api.nvim_create_augroup("workspace_rc", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    load_workspace_rc_once()
  end,
  group = load_rc_group,
})
