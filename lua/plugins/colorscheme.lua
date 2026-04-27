return {
  {
    "afonsofrancof/OSC11.nvim",
    lazy = false,
    priority = 1001,
    cond = not vim.g.vscode,
    config = function()
      require("osc11").setup({
        on_dark = function()
          vim.cmd.colorscheme("kanagawa-dragon")
        end,
        on_light = function()
          vim.cmd.colorscheme("catppuccin-latte")
        end,
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    cond = not vim.g.vscode,
    opts = {
      overrides = function(_)
        return {
          LineNr = { bg = "none" },
          LineNrAbove = { bg = "none" },
          LineNrBelow = { bg = "none" },
        }
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    cond = not vim.g.vscode,
    opts = {
      flavour = "latte",
    },
  },
}
