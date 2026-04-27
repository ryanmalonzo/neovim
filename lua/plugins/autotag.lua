return {
  {
    "windwp/nvim-ts-autotag",
    version = "8e1c0a389f20bf7f5b0dd0e00306c1247bda2595",
    cond = not vim.g.vscode,
    event = "BufReadPre",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
