return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    version = "v3.0.2",
    priority = 1000,
    cond = not vim.g.vscode,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
