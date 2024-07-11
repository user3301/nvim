return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- after setting up completion using nvim-cmp, the default capabilities
      -- is required to attached to each langauge server to enable code snippets
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              special = {
                reload = "require",
              },
            },
            diagnostics = {
              globals = { "vim", "reload" },
            },
          }
        }
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
    end
  }
}
