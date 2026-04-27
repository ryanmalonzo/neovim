return {
  {
    "kylechui/nvim-surround",
    version = "v4.0.2",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
