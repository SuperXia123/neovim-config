return {
  ------------------------------------------------------------------------------
  -- specify to be installed colorscheme
  ------------------------------------------------------------------------------
  { "ellisonleao/gruvbox.nvim" },
  require("colorschemes.library.catppuccin"),
  { "rebelot/kanagawa.nvim", lazy = false },
  { "navarasu/onedark.nvim" },
  { "scottmckendry/cyberdream.nvim", lazy = false },

  ------------------------------------------------------------------------------
  -- configure lazyvim to load specified theme
  ------------------------------------------------------------------------------
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
