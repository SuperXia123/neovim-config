-- 设置代码对齐线
vim.opt.colorcolumn = "81"

-- 控制是否开启blamer
ENABLE_BLAMER = false

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

-- 折叠配置
local options = {
  -- backup = false,                          -- creates a backup filr
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 1,                           -- keep status bar position close to bottom
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0,                        -- so that `` is visible in markdown files
  -- fileencoding = "utf-8",                  -- the encoding written to a file
  -- hlsearch = true,                         -- highlight all matches on previous search pattern
  -- ignorecase = true,                       -- ignore case in search patterns
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  -- pumheight = 10,                          -- pop up menu height
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                         -- always show tabs
  -- smartcase = true,                        -- smart case
  -- smartindent = true,                      -- make indenting smarter again
  -- splitbelow = true,                       -- force all horizontal splits to go below current window
  -- splitright = true,                       -- force all vertical splits to go to the right of current window
  -- swapfile = false,                        -- creates a swapfile
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  -- undofile = true,                         -- enable persistent undo
  -- updatetime = 300,                        -- faster completion (4000ms default)
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- expandtab = true,                        -- convert tabs to spaces
  -- shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  -- tabstop = 2,                             -- insert 2 spaces for a tab
  -- cursorline = true,                       -- highlight the current line
  -- cursorcolumn = false,                    -- cursor column.
  -- number = true,                           -- set numbered lines
  -- relativenumber = false,                  -- set relative numbered lines
  -- numberwidth = 4,                         -- set number column width to 2 {default 4}
  -- signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  -- wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- keep 8 height offset from above and bottom
  sidescrolloff = 8,                       -- keep 8 width offset from left and right
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  foldmethod = "indent",                     -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,                      -- no fold to be applied when open a file
  foldlevel = 99,                          -- if not set this, fold will be everywhere
  -- spell = false,                            -- add spell support
  -- spelllang = { 'en_us' },                 -- support which languages?
  -- diffopt="vertical,filler,internal,context:4",                      -- vertical diff split view
  -- cscopequickfix="s-,c-,d-,i-,t-,e-",       -- cscope output to quickfix window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
