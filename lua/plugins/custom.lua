return {
  -- Disable default plugins
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "MunifTanjim/nui.nvim", enabled = false },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      lazygit = { enable = true },
      picker = {
        main = { current = true }, -- Open files in the currently focused window
      },
      scroll = { enabled = false },
    },
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Open LazyGit",
      },
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        gitsigns = true,
        leap = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        snacks = true,
        treesitter = true,
        treesitter_context = true,
      },
      styles = {
        comments = {},
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    opts = {
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 500,
        autosave_changes = true,
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        vtsls = {
          settings = {
            typescript = {
              maxTsServerMemory = 8192,
            },
          },
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
}
