-- Utilities for creating configurations
local util = require "formatter.util"

local opts = {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- 模板
    template = {
      -- 可以从formatter默认配置加载
      require("formatter.filetypes.lua").stylua,
      -- 也可以在此处自定义
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end
        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },

    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--style=file",
            -- "-assume-filename",
            -- util.escape_path(util.get_current_buffer_file_name()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },

    lua = { require("formatter.filetypes.lua").stylua },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

return opts
