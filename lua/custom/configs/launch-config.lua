-- PLUGIN DEFAULTS
local default_cfg = {
  -- debugger settings
  debug = {
    -- mapping from filetypes to debug adapter names as specified in `require('dap').adapters`
    -- `nil` implies that the filetypes themselves are used as the adapter names
    adapters = nil, ---@type table<string, string>

    -- disable all debugger related functionality
    disable = false, ---@type boolean

    -- custom debugger launcher function which receives the selected debug configuration as an
    -- argument; `nil` implies `require('dap').run` is used by default
    -- NOTE : users should ignore this unless they know what they are doing
    runner = nil, ---@type function

    -- table containing debug configuration template per filetype
    templates = nil,
  },

  -- task runner settings
  task = {
    -- whether to render the task output in a tabpage or a floating window, by default
    display = 'float', ---@type 'float' | 'tab'

    -- configuration options for floating window, see {config} in `:h nvim_open_win()`
    float_config = {
      relative = 'editor',
      border = 'rounded',
      title_pos = 'center',
      style = 'minimal',
    },

    -- custom user functions which will be executed before and/or after creating a floating
    -- window or a tabpage for a newly launched task
    hooks = {
      -- floating window hooks
      float = {
        pre = nil, ---@type function
        post = nil, ---@type function
      },
      -- tabpage hooks
      tab = {
        pre = nil, ---@type function
        post = nil, ---@type function
      },
    },

    -- whether to enter INSERT mode after launching task in a buffer
    insert_on_launch = false, ---@type boolean

    -- same fields as `TaskOptions` in "Task Configuration" subsection
    options = {
      -- set the default current working directory for all tasks
      cwd = nil, ---@type string

      -- table with definitions of environment variables to be set for all tasks
      env = nil, ---@type table<string, string|number>

      -- table containing executable and command-line arguments to launch a shell process
      shell = nil, ---@type { exec: string, args: string[] }
    },

    -- custom task launcher function which receives the selected task configuration as an
    -- argument; `nil` implies `require('launch.task').runner` is used by default
    -- NOTE : users should ignore this unless they know what they are doing
    runner = nil, ---@type function

    -- config options for opening task in a terminal instance; see {opts} in `:h jobstart()`
    term = {
      clear_env = false,
    },
  },
}

return default_cfg
