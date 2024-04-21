-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "angularls",
        "lua_ls",
        "diagnosticls",
        "cssls",
        -- "emmet_ls",
        -- "cssmodules_ls", -- vscode css lsp
        "html",
        "bashls",
        "pyright",
        "omnisharp",
        "sqlls",
        "rust_analyzer",
        "marksman", -- markdown
        "lemminx", -- xml
        "yamlls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        "pylama",
        "ltrs", -- LanguageTool-Rust
        "prettier",
        "markuplint",
        "xo",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        "netcoredbg",
      },
    },
  },
}
