return {
  {
    url = "https://git.disroot.org/andyg/leap.nvim",
    commit = "156c71aabb68d520c6269db4103c8e5580e3ea67",
    keys = {
      { "s", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward" },
      { "S", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward" },
    },
    config = function()
      require("leap").setup({})
    end,
  },
}
