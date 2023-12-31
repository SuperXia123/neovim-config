-- see supported lsps here:
-- ~/.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig/server_configurations
local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capacities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capacities = capacities,
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}

-- lspconfig.pyright.setup {}
lspconfig.bufls.setup {}
-- lspconfig.buf.setup {}

