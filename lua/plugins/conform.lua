return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  cond = not vim.g.vscode,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
      typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = { timeout_ms = 500 },
    formatters = {
      -- Custom biome formatter that only runs if biome config exists
      ["biome-check"] = {
        -- Use project-local biome if available, fallback to global
        command = function(self, ctx)
          local root = require("conform.util").root_file({ "biome.json", "biome.jsonc" })(self, ctx)
          if root then
            local local_biome = root .. "/node_modules/.bin/biome"
            if vim.fn.executable(local_biome) == 1 then
              return local_biome
            end
          end
          return "biome"
        end,
        args = {
          "check",
          "--write",
          "--unsafe",
          "--stdin-file-path",
          "$FILENAME",
        },
        stdin = true,
        -- Wrap in function for lazy evaluation
        cwd = function(self, ctx)
          return require("conform.util").root_file({ "biome.json", "biome.jsonc" })(self, ctx)
        end,
        require_cwd = true,
      },
    },
  },
}
