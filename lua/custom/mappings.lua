function SearchSymbols()
  vim.cmd "Telescope lsp_document_symbols symbol_width=60 show_line=false"
end

local M = {}

-- In order to disable a default keymap, use
M.disabled = {
--   n = {
--       ["<leader>h"] = "",
--       ["<C-a>"] = ""
--   }
}

-- Your custom mappings
M.abc = {
  n = {
    -- 使用telescope搜索文件大纲
    -- about symbols_width and show_line see: 
    -- https://www.reddit.com/r/neovim/comments/13f425s/help_needed_with_telescopebuiltinlsp_document/
    ["<F12>"] = {":lua SearchSymbols() <CR>", "symbols outline"},
    ["j"] = { "jzz", "jump down and focus" , opts = { nowait = true }},
    ["k"] = { "kzz", "jump up and focus" , opts = { nowait = true }},
  },

  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

return M
