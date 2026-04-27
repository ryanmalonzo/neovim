return {
  {
    "neovim/nvim-lspconfig",
    version = "v2.6.0",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("config.lsp")
    end,
  },
}
