return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  keys = {
    {
      "<leader>fs",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = "Rip substitute  ",
    },
  },
  config = function()
    require("rip-substitute").setup({
      keymaps = {
        -- normal & visual mode
        confirm = "<CR>",
        abort = "<Esc>",
        prevSubst = "<Up>",
        nextSubst = "<Down>",
        openAtRegex101 = "R",
        insertModeConfirm = "<C-CR>", -- (except this one, obviously)
      },
    })
  end,
}
