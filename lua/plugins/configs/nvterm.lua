local float_width = 0.85
local float_height = 0.8

local opts = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = (1 - float_height) * 0.5,
        col = (1 - float_width) * 0.5,
        width = float_width,
        height = float_height,
        border = "rounded",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

return opts
