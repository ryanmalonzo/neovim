---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        isort = {
          preprend_args = { "--profile", "black" },
        },
      },

      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        markdown = { "prettierd" },
        python = { "isort", "black" },
        html = { "prettierd" },
        css = { "prettierd" },
      },
    },
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
