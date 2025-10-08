return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    lazygit = {},
    picker = {},
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open LazyGit" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
  }
}
