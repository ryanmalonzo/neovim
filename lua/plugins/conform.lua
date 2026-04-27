local function biome_or_prettier(bufnr)
  local conform = require("conform")

  if conform.get_formatter_info("biome", bufnr).available then
    return { "biome" }
  end

  return { "prettierd", "eslint_d" }
end

return {
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
}
