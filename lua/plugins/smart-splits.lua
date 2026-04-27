return {
  {
    "mrjones2014/smart-splits.nvim",
    cond = not vim.g.vscode and vim.fn.executable("tmux") == 1,
    lazy = false,
    config = function()
      local smart_splits = require("smart-splits")

      vim.keymap.set({ "n", "t" }, "<A-h>", smart_splits.move_cursor_left)
      vim.keymap.set({ "n", "t" }, "<A-j>", smart_splits.move_cursor_down)
      vim.keymap.set({ "n", "t" }, "<A-k>", smart_splits.move_cursor_up)
      vim.keymap.set({ "n", "t" }, "<A-l>", smart_splits.move_cursor_right)

      vim.keymap.set({ "n", "t" }, "<A-H>", smart_splits.resize_left)
      vim.keymap.set({ "n", "t" }, "<A-J>", smart_splits.resize_down)
      vim.keymap.set({ "n", "t" }, "<A-K>", smart_splits.resize_up)
      vim.keymap.set({ "n", "t" }, "<A-L>", smart_splits.resize_right)

      vim.keymap.set({ "n", "t" }, "<leader><leader>h", smart_splits.swap_buf_left)
      vim.keymap.set({ "n", "t" }, "<leader><leader>j", smart_splits.swap_buf_down)
      vim.keymap.set({ "n", "t" }, "<leader><leader>k", smart_splits.swap_buf_up)
      vim.keymap.set({ "n", "t" }, "<leader><leader>l", smart_splits.swap_buf_right)
    end,
  },
}
