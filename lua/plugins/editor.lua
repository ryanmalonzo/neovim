return {
  {
    "windwp/nvim-autopairs",
    version = "0.10.0",
    event = "InsertEnter",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    version = "v0.8.0",
    keys = {
      { "gc", mode = { "n", "v" } },
      { "gcc", mode = "n" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "NMAC427/guess-indent.nvim",
    commit = "84a4987ff36798c2fc1169cbaff67960aed9776f",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("guess-indent").setup()
    end,
  },

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

  {
    "kylechui/nvim-surround",
    version = "v4.0.2",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "tpope/vim-obsession",
    version = "ed9dfc7c2cc917ace8b24f4f9f80a91e05614b63",
    cond = not vim.g.vscode,
  },

  {
    "mrjones2014/smart-splits.nvim",
    cond = not vim.g.vscode and vim.fn.executable("tmux") == 1,
    lazy = false,
    config = function()
      local smart_splits = require("smart-splits")

      vim.keymap.set({ "n", "t" }, "<A-h>", smart_splits.resize_left)
      vim.keymap.set({ "n", "t" }, "<A-j>", smart_splits.resize_down)
      vim.keymap.set({ "n", "t" }, "<A-k>", smart_splits.resize_up)
      vim.keymap.set({ "n", "t" }, "<A-l>", smart_splits.resize_right)

      vim.keymap.set({ "n", "t" }, "<C-h>", smart_splits.move_cursor_left)
      vim.keymap.set({ "n", "t" }, "<C-j>", smart_splits.move_cursor_down)
      vim.keymap.set({ "n", "t" }, "<C-k>", smart_splits.move_cursor_up)
      vim.keymap.set({ "n", "t" }, "<C-l>", smart_splits.move_cursor_right)
      vim.keymap.set({ "n", "t" }, "<C-\\>", smart_splits.move_cursor_previous)

      vim.keymap.set({ "n", "t" }, "<leader><leader>h", smart_splits.swap_buf_left)
      vim.keymap.set({ "n", "t" }, "<leader><leader>j", smart_splits.swap_buf_down)
      vim.keymap.set({ "n", "t" }, "<leader><leader>k", smart_splits.swap_buf_up)
      vim.keymap.set({ "n", "t" }, "<leader><leader>l", smart_splits.swap_buf_right)
    end,
  },
}
