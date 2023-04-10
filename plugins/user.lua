return {
  -- {
  --   WARNING todo-comments.nvim is included in plugins/community.lua
  --   this just demonstrates how to add new plugins
  --   "folke/todo-comments.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function() require("todo-comments").setup {} end,
  --   event = "User Astrofile",
  --   cmd = { "TodoQuickFix" }, -- load the plugin when running these commands
  --   keys = {                  -- load the plugin when using these keys
  --     { "<leader>TD", "<cmd>TodoTelescope<cr>", desc = "Open todo-comments.nvim in Telescope" },
  --   },
  -- },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function() require("trouble").setup {} end,
    event = "User Astrofile",
    cmd = { "TroubleToggle" },
    keys = {
      { "<leader>Tt", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble.nvim" },
      { "<leader>Tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble.nvim Workspace Diagnostics" },
      { "<leader>Td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble.nvim Document Diagnostics" },
      { "<leader>Tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble.nvim QuickFix" },
      { "<leader>Tl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble.nvim Location List" },
      { "<leader>Tr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble.nvim Lsp References" },
    },
  },
}
