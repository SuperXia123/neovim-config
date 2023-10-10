-- 配置buf进入时的配置触发
-- 这里的配置会覆写默认配置
local function on_buf_enter()
  -- 光标位于注释行时，按下“o”新起的行不带注释
  vim.cmd "set formatoptions-=o"
end

local buf_enter_group = vim.api.nvim_create_augroup("on_buf_enter", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = on_buf_enter,
  group = buf_enter_group,
})
