return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            base = "#000000",
          },
        },
        flavour = "mocha",
        float = {
          transparent = false,
          solid = false,
        },
        integrations = {
          dashboard = true,
          grug_far = true,
          gitsigns = true,
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          noice = true,
          snacks = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
        styles = {
          comments = {},
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
