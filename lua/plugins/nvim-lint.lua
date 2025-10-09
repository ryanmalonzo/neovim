return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "biomejs", "eslint_d", "eslint" },
      typescript = { "biomejs", "eslint_d", "eslint" },
      javascriptreact = { "biomejs", "eslint_d", "eslint" },
      typescriptreact = { "biomejs", "eslint_d", "eslint" },
    }

    lint.linters.eslint_d.args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }
  end,
}
