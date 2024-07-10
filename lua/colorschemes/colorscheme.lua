return {
  ------------------------------------------------------------------------------
  -- specify to be installed colorscheme
  ------------------------------------------------------------------------------
  -- gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },
  {"rebelot/kanagawa.nvim"},

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
