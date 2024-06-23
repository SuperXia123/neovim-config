-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
return {
  -- * override the configuration of LazyVim plugins
  -- lsp-config
  require("plugins.lsp.mason-lspconfig"),
  -- auto save
  require("plugins.auto-save.auto-save"),
  -- status line
  require("plugins.ui.lualine"),
  -- project management
  require("plugins.project.project"),
  -- formatting
  require("plugins.formatting.formatter"),
  -- buffer manager
  require("plugins.ui.buffer-manager"),
  -- buffer-line
  require("plugins.ui.bufferline"),
  -- telescope
  require("plugins.telescope.telescope"),
  -- blamer
  require("plugins.git.blamer"),
  -- editor
  require("plugins.editor.rainbow-delimiters"),
  require("plugins.editor.treesitter"),
  -- dap
  require("plugins.dap.nvim-dap"),
  require("plugins.dap.nvim-dap-ui"),
  require("plugins.dap.nvim-dap-virtual-text"),
  -- utils
  { "nvim-neotest/nvim-nio" },
}
