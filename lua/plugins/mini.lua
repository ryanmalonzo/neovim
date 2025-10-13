return {
  "nvim-mini/mini.nvim",
  version = false,
  cond = not vim.g.vscode,
  config = function()
    require("mini.pairs").setup()
  end,
}
