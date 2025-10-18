return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  cond = not vim.g.vscode,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Try Biome first (if config exists), then fall back to Prettier
      javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
      json = { "biome", "prettierd", "prettier", stop_after_first = true },
      jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      scss = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    formatters = {
      -- Biome: prefer project-local installation, only run if config exists
      biome = {
        command = function(self, ctx)
          local util = require("conform.util")
          local root = util.root_file({ "biome.json", "biome.jsonc" })(self, ctx)

          if root then
            -- Try project-local installation first
            local local_biome = vim.fs.joinpath(root, "node_modules", ".bin", "biome")
            if vim.fn.executable(local_biome) == 1 then
              return local_biome
            end
          end

          -- Fall back to global installation
          return "biome"
        end,
        args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
        stdin = true,
        cwd = function(self, ctx)
          return require("conform.util").root_file({ "biome.json", "biome.jsonc" })(self, ctx)
        end,
        require_cwd = true, -- Only run if biome config exists
      },

      -- Prettier: prefer project-local installation
      prettier = {
        command = function(self, ctx)
          local util = require("conform.util")
          local root = util.root_file({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            "package.json",
          })(self, ctx)

          if root then
            local local_prettier = vim.fs.joinpath(root, "node_modules", ".bin", "prettier")
            if vim.fn.executable(local_prettier) == 1 then
              return local_prettier
            end
          end

          return "prettier"
        end,
      },

      -- Prettierd: daemon for faster formatting, prefer project-aware installation
      prettierd = {
        command = "prettierd",
      },

      -- Stylua: Lua formatter
      stylua = {
        command = function(self, ctx)
          local util = require("conform.util")
          local root = util.root_file({ "stylua.toml", ".stylua.toml" })(self, ctx)

          if root then
            local local_stylua = vim.fs.joinpath(root, "node_modules", ".bin", "stylua")
            if vim.fn.executable(local_stylua) == 1 then
              return local_stylua
            end
          end

          return "stylua"
        end,
      },
    },
  },
}
