return {
  ------------------------------------------------------------------------------
  -- specify to be installed colorscheme
  ------------------------------------------------------------------------------
  { "ellisonleao/gruvbox.nvim" },
  require("colorschemes.library.catppuccin"),
  require("colorschemes.library.kanagawa"),
  { "navarasu/onedark.nvim" },
  { "scottmckendry/cyberdream.nvim", lazy = false },

  ------------------------------------------------------------------------------
  -- configure lazyvim to load specified theme
  ------------------------------------------------------------------------------
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
