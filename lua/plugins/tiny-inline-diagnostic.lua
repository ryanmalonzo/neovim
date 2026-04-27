return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    version = "ecce93ff7db4461e942c03e0fcc64bd785df4057",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
