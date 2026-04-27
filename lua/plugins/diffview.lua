return {
  {
    "dlyongemallo/diffview.nvim",
    commit = "f81170ee78304944fc1dba1141d371a6811ee38a",
    cmd = {
      "DiffviewOpen",
      "DiffviewToggle",
      "DiffviewFileHistory",
      "DiffviewDiffFiles",
      "DiffviewLog",
      "DiffviewClose",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
      { "<leader>gf", ":DiffviewFileHistory<CR>", mode = "v", desc = "Selection history" },
    },
    cond = not vim.g.vscode,
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
      })
    end,
  },
}
