return {
  "williamboman/mason-lspconfig.nvim",
  init = function()
    -- 加载lsp的key-mapping
    require("core.utils").load_mappings "lspconfig"

    -- 指定强制依赖的lsp-server
    require("mason-lspconfig").setup {
      -- ensure_installed = { "clangd", "pyright" },
    }

    require("mason-lspconfig").setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      -- function(server_name) -- default handler (optional)
      --   require("lspconfig")[server_name].setup {}
      -- end,
      -- Next, you can provide a dedicated handler for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      ["clangd"] = function()
        require("lspconfig").clangd.setup {
          filetypes = {
            "c",
            "cpp",
            --  "objc", "objcpp", "cuda"
          },
        }
      end,
      ["bufls"] = function()
        require("lspconfig").bufls.setup {}
      end,
      ["pyright"] = function()
        require("lspconfig").pyright.setup {}
      end,
    }
  end,
}
