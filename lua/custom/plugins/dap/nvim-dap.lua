return {
  "mfussenegger/nvim-dap",
  config = function()
    require("core.utils").load_mappings "dap"
    require "custom.plugins.dap.nvim-dap-configs.dap-symbol-config"
    require "custom.plugins.dap.nvim-dap-configs.dap-adapter-config"
  end,
}
