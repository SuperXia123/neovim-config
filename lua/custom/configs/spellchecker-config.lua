-- 使能拼写检查
vim.opt.spell = true
-- 使能根据syntax的着色与高亮
vim.cmd "syntax on"
-- Chinese/Japanese/Korean拼写检查关闭
vim.opt.spelllang = { "en_us", "cjk" }
-- 使能驼峰变量的spell-check
vim.opt.spelloptions = "camel"
-- 关闭首字母大写检查, see https://neovim.io/doc/user/options.html#'spellcapcheck'
vim.opt.spellcapcheck = ""

local autocmd = vim.api.nvim_create_autocmd
local spell_augroup = vim.api.nvim_create_augroup("spell_augroup", { clear = true })
-- 关闭对指定文件类型的spell-check
autocmd("FileType", {
  pattern = { "json", "lua" },
  command = "setlocal nospell",
  group = spell_augroup,
})
-- 关闭terminal的spell-check
autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nospell",
  group = spell_augroup,
})
-- 允许对语法单词做拼写检查
-- autocmd设置在Syntax配置后执行此命令以覆盖
-- see https://vi.stackexchange.com/questions/21492/enable-spelling-in-code-files-outside-of-comments
autocmd({ "Syntax" }, {
  pattern = "*",
  callback = function()
    vim.cmd "syntax spell toplevel"
  end,
  group = spell_augroup,
})
