return {
  {
    "https://codeberg.org/andyg/leap.nvim",
    config = function()
      do
        local clever_s = require("leap.user").with_traversal_keys("s", "S")
        vim.keymap.set({ "n", "x", "o" }, "s", function()
          require("leap").leap({ opts = clever_s })
        end)
        vim.keymap.set({ "n", "x", "o" }, "S", function()
          require("leap").leap({ backward = true, opts = clever_s })
        end)
      end
    end,
  },
}
