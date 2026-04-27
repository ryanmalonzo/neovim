return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    version = "v1.0.0",
    cond = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup()
    end,
  },
}
