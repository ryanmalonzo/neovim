vim.pack.add({
  {
    src = "https://github.com/zuqini/zpack.nvim",
    version = "1cf8b96595408d9fb5f645f8f3b3c822b0dbea03",
  },
})

require("zpack").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    sem_version = "~1.11.0",
    priority = 1000,
    cond = not vim.g.vscode,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        float = {
          transparent = true,
        },
        integrations = {
          telescope = {
            enabled = true,
          },
          gitsigns = true,
          mason = true,
          treesitter = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "folke/snacks.nvim",
    sem_version = "~2.30.0",
    priority = 1000,
    lazy = false,
    cond = not vim.g.vscode,
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gp",
        function()
          Snacks.picker.gh_pr({ state = "all" })
        end,
        desc = "GitHub PRs (all)",
      },
    },
    config = function()
      require("snacks").setup({
        lazygit = { enabled = true },
        picker = { enabled = true },
        rename = { enabled = true },
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    sem_version = "~0.10.0",
    build = ":TSUpdate",
    cond = not vim.g.vscode,
    config = function()
      local parsers = {
        "lua",
        "prisma",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
      }

      require("nvim-treesitter").setup({})
      require("nvim-treesitter").install(parsers)

      -- Enable highlighting via autocmd (new API)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "lua",
          "prisma",
          "vim",
          "markdown",
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "json",
          "html",
          "css",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    sem_version = "~1.0.0",
    cond = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup()
    end,
  },

  {
    "mason-org/mason.nvim",
    sem_version = "~2.2.1",
    cond = not vim.g.vscode,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    sem_version = "~2.1.0",
    dependencies = { "mason-org/mason.nvim" },
    cond = not vim.g.vscode,
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    commit = "517ef5994ef9d6b738322664d5fdd948f0fdeb46",
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
    cond = not vim.g.vscode,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "biome",
          "eslint",
          "eslint_d",
          "lua_ls",
          "prettierd",
          "prisma-language-server",
          "stylua",
          "vtsls",
        },
        run_on_start = true,
        integrations = {
          ["mason-lspconfig"] = true,
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    sem_version = "~2.5.0",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("plugins.lsp")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    sem_version = "~0.2.1",
    cmd = "Telescope",
    dependencies = { { "nvim-lua/plenary.nvim", version = "v0.1.4" } },
    cond = not vim.g.vscode,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    sem_version = "~2.0.0",
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "]c", gs.next_hunk, opts)
          vim.keymap.set("n", "[c", gs.prev_hunk, opts)
          vim.keymap.set("n", "<leader>gs", gs.blame_line, opts)
        end,
      })
    end,
  },

  {
    "windwp/nvim-autopairs",
    version = "0.10.0",
    event = "InsertEnter",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    sem_version = "~0.8.0",
    keys = {
      { "gc", mode = { "n", "v" } },
      { "gcc", mode = "n" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "NMAC427/guess-indent.nvim",
    commit = "84a4987ff36798c2fc1169cbaff67960aed9776f",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("guess-indent").setup()
    end,
  },

  {
    "saghen/blink.cmp",
    sem_version = "~1.8.0",
    dependencies = { { "rafamadriz/friendly-snippets", version = "572f5660cf05f8cd8834e096d7b4c921ba18e175" } },
    event = { "InsertEnter", "CmdlineEnter" },
    cond = not vim.g.vscode,
    config = function()
      require("blink.cmp").setup({
        keymap = { preset = "default" },
        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
      })
    end,
  },

  {
    url = "https://codeberg.org/andyg/leap.nvim",
    commit = "59fd447a103ab078969c81e8586a2241e29ccfea",
    keys = {
      { "s", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward" },
      { "S", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward" },
    },
    config = function()
      require("leap").setup({})
    end,
  },

  {
    "stevearc/oil.nvim",
    sem_version = "~2.15.0",
    dependencies = { { "nvim-mini/mini.icons", version = "v0.17.0" } },
    lazy = false,
    cond = not vim.g.vscode,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    config = function()
      require("mini.icons").setup()
      require("oil").setup({
        default_file_explorer = true,
        icons = {
          provider = "mini.icons",
        },
        view_options = {
          show_hidden = false,
        },
      })

      -- Integrate with snacks.nvim rename
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
          if event.data.err then
            return
          end
          for _, action in ipairs(event.data.actions) do
            if action.type == "move" then
              Snacks.rename.on_rename_file(action.src_url, action.dest_url)
            end
          end
        end,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    sem_version = "~9.1.0",
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = function(bufnr)
            if conform.get_formatter_info("biome", bufnr).available then
              return { "biome" }
            else
              return { "prettierd", "eslint_d" }
            end
          end,
          javascriptreact = function(bufnr)
            if conform.get_formatter_info("biome", bufnr).available then
              return { "biome" }
            else
              return { "prettierd", "eslint_d" }
            end
          end,
          typescript = function(bufnr)
            if conform.get_formatter_info("biome", bufnr).available then
              return { "biome" }
            else
              return { "prettierd", "eslint_d" }
            end
          end,
          typescriptreact = function(bufnr)
            if conform.get_formatter_info("biome", bufnr).available then
              return { "biome" }
            else
              return { "prettierd", "eslint_d" }
            end
          end,
          lua = { "stylua" },
        },
        formatters = {
          biome = {
            cwd = require("conform.util").root_file({
              "biome.json",
              "biome.jsonc",
            }),
            require_cwd = true,
          },
          eslint_d = {
            cwd = require("conform.util").root_file({
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
            }),
            require_cwd = true,
          },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },

  {
    "Almo7aya/openingh.nvim",
    sem_version = "~1.0.14",
    keys = {
      { "<leader>gh", "<cmd>OpenInGHFile<cr>", desc = "Open file in GitHub" },
      { "<leader>gh", ":OpenInGHFileLines<CR>", mode = "v", desc = "Open file with lines in GitHub" },
    },
  },

  {
    "kylechui/nvim-surround",
    sem_version = "~3.1.8",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-surround").setup({
        -- Default keymaps:
        -- Normal mode:
        --   ys{motion}{char} - Add surround
        --   ds{char}         - Delete surround
        --   cs{old}{new}     - Change surround
        -- Visual mode:
        --   S{char}          - Add surround
      })
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    version = "ecce93ff7db4461e942c03e0fcc64bd785df4057",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
      })
      -- Disable Neovim's default virtual text diagnostics
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
})
