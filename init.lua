return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "kanagawa",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000,   -- default format timeout
      filter = function(_) -- HACK: disable formatting for cshtml
        -- TODO: remove once someone fucking updates omnisharp to include razorls
        if vim.bo.filetype == "html" then
          local bufname = vim.api.nvim_buf_get_name(0)
          return string.find(bufname, "[%w%.]+%.cshtml%.[%w]*") == nil
        end
        return true
      end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      html = {
        -- HACK: add razor filetype to html server
        -- TODO: extend init_options table to include c# in embeddedLanguages
        -- TODO: extend luasnip to enable html snippet completion in razor files
        filetypes = { "html", "razor" },
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Razor filetype
    vim.filetype.add {
      extension = {
        cshtml = "razor",
      },
      filename = {
        ["Razor"] = "razor",
      },
      pattern = {
        ["*.cshtml*"] = "razor",
      },
    }
    -- enable treesitter html parser for razor files
    vim.api.nvim_create_autocmd("User", {
      pattern = "AstroFile",
      desc = "Enable Treesitter html syntax highlighting for razor files",
      group = vim.api.nvim_create_augroup("razor_config", { clear = true }),
      callback = function()
        if vim.bo.ft == "razor" then vim.treesitter.start(vim.fn.bufnr(), "html") end
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "razor", "html", "css", "javascript" },
      desc = "Change indentation for webdev languages to 2 spaces instead of four",
      group = vim.api.nvim_create_augroup("autoindentation", { clear = true }),
      callback = function()
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
      end,
    })
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
