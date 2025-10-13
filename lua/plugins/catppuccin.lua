return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  cond = not vim.g.vscode,
  opts = {
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
      gitsigns = true,
      leap = true,
      mason = true,
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
      snacks = true,
      treesitter = true,
      treesitter_context = true,
    },
    styles = {
      comments = {},
    },
  },
}
