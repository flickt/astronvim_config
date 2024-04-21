-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "c",
      "lua",
      "query",
      "vim",
      "vimdoc",
      -- above should always be installed
      "c_sharp",
      "comment",
      "css",
      "devicetree",
      "diff",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "html",
      "http",
      "javascript",
      "json",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "typescript",
      "yaml",
    })
    opts.indent = { enable = false }
    -- return opts
  end,
}
