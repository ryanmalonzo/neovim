local function biome_or_prettier(bufnr)
  local conform = require("conform")

  if conform.get_formatter_info("biome", bufnr).available then
    return { "biome" }
  end

  return { "prettierd", "eslint_d" }
end

return {
  {
    "saghen/blink.cmp",
    version = "v1.9.1",
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
    "stevearc/conform.nvim",
    version = "v9.1.0",
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      local util = require("conform.util")

      require("conform").setup({
        formatters_by_ft = {
          javascript = biome_or_prettier,
          javascriptreact = biome_or_prettier,
          typescript = biome_or_prettier,
          typescriptreact = biome_or_prettier,
          lua = { "stylua" },
        },
        formatters = {
          biome = {
            args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
            cwd = util.root_file({
              "biome.json",
              "biome.jsonc",
            }),
            require_cwd = true,
          },
          eslint_d = {
            cwd = util.root_file({
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
    "dmmulroy/tsc.nvim",
    version = "v2.10.1",
    cond = not vim.g.vscode,
    config = function()
      require("tsc").setup()
    end,
  },

  {
    "nvim-neotest/neotest",
    cmd = "Neotest",
    keys = {
      {
        "<leader>tt",
        function()
          local neotest = require("neotest")
          neotest.output_panel.clear()
          neotest.output_panel.open()
          neotest.run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tf",
        function()
          local neotest = require("neotest")
          neotest.output_panel.clear()
          neotest.output_panel.open()
          neotest.run.run(vim.fn.expand("%"))
        end,
        desc = "Run test file",
      },
    },
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({}),
          require("neotest-vitest"),
        },
        status = {
          signs = true,
          virtual_text = true,
        },
        output = {
          enabled = true,
          open_on_run = "short",
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 12",
        },
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    version = "8e1c0a389f20bf7f5b0dd0e00306c1247bda2595",
    cond = not vim.g.vscode,
    event = "BufReadPre",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
