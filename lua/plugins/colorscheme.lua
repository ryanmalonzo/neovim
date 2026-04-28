return {
  {
    "afonsofrancof/OSC11.nvim",
    lazy = false,
    priority = 1001,
    cond = not vim.g.vscode,
    config = function()
      require("osc11").setup({
        on_dark = function()
          vim.cmd.colorscheme("catppuccin-mocha")
        end,
        on_light = function()
          vim.cmd.colorscheme("catppuccin-latte")
        end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    cond = not vim.g.vscode,
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      default_integrations = true,
      integrations = {
        blink_cmp = {
          enabled = true,
          style = "bordered",
        },
        diffview = true,
        gitsigns = true,
        leap = true,
        mason = true,
        neotest = true,
        snacks = {
          enabled = true,
          indent_scope_color = "",
        },
        treesitter = true,
        treesitter_context = true,
      },
    },
  },
}
