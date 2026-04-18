local treesitter_parsers = {
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
  "yaml",
}

local treesitter_filetypes = {
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
  "yaml",
}

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    version = "v3.0.2",
    priority = 1000,
    cond = not vim.g.vscode,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          transparency = true,
        },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  {
    "folke/snacks.nvim",
    version = "v2.30.0",
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
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent Files",
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "<leader>fS",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
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
    lazy = false,
    build = ":TSUpdate",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-treesitter").setup({})
      require("nvim-treesitter").install(treesitter_parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = treesitter_filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    version = "v1.0.0",
    cond = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup()
    end,
  },

  {
    "stevearc/oil.nvim",
    version = "v2.15.0",
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
    "rachartier/tiny-inline-diagnostic.nvim",
    version = "ecce93ff7db4461e942c03e0fcc64bd785df4057",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
