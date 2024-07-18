return {
  ------------------------------------------------------------------------------
  -- specify to be installed colorscheme
  ------------------------------------------------------------------------------
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },
  { "scottmckendry/cyberdream.nvim", lazy = false },
  { "rakr/vim-one" },
  require("colorschemes.library.catppuccin"),
  require("colorschemes.library.kanagawa"),

  ------------------------------------------------------------------------------
  -- configure lazyvim to load specified theme
  ------------------------------------------------------------------------------
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one",
    },
  },
}
