-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "diagnosticls",
        -- "emmet_ls",
        "cssmodules_ls", -- vscode css lsp
        "rome",          -- JavaScript, TypeScript, JSON, soon to support HTML, CSS, and Markdown
        "html",
        "bashls",
        "pyright",
        "omnisharp",
        "sqlls",
        "marksman", -- markdown
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
