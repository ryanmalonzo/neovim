return {
  {
    "windwp/nvim-autopairs",
    version = "0.10.0",
    event = "InsertEnter",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
}
