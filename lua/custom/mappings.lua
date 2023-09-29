function SymbolsSearch()
  vim.cmd 'AerialOpen'
  vim.cmd 'Telescope current_buffer_fuzzy_find'
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
     -- ["<C-n>"] = {"<cmd> Telescope <CR>", "Telescope"},
     -- ["<C-s>"] = {":Telescope Files <CR>", "Telescope Files"} 
     ["<F12>"] = {":lua SymbolsSearch() <CR>", "symbols outline"},
     ["j"] = { "jzz", "jump down and focus" , opts = { nowait = true }},
     ["k"] = { "kzz", "jump up and focus" , opts = { nowait = true }},
  },

  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    -- ...
  }
}

M.symbols_outline = {
  n = {

  },

  i = {

  }
}

return M
