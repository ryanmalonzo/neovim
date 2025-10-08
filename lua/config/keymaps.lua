local keymap = vim.keymap.set

keymap("n", "<leader>lg", function()
  Snacks.lazygit.open()
end, { desc = "Open LazyGit" })
