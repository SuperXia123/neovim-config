return {
  "j-morano/buffer_manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",

  ------------------------------------------------------------------------------
  -- CONFIG
  ------------------------------------------------------------------------------
  config = function()
    require("core.utils").load_mappings "buffer_manager"
    require("buffer_manager").setup {
      line_keys = "1234567890",
      select_menu_item_commands = {
        edit = {
          key = "<CR>",
          command = "edit",
        },
      },
      focus_alternate_buffer = true,
      width = 0.5,
      height = 0.5,
      short_file_names = true,
      short_term_names = false,
      loop_nav = true,
      highlight = "",
      win_extra_options = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
  end,
}
