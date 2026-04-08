return {
  {
    "lewis6991/gitsigns.nvim",
    version = "v2.0.0",
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local opts = { buffer = bufnr }

          vim.keymap.set("n", "]c", gs.next_hunk, opts)
          vim.keymap.set("n", "[c", gs.prev_hunk, opts)
          vim.keymap.set("n", "<leader>gb", gs.blame_line, opts)
        end,
      })
    end,
  },

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

  {
    "Almo7aya/openingh.nvim",
    version = "v1.0.14",
    keys = {
      { "<leader>gh", "<cmd>OpenInGHFile<cr>", desc = "Open file in GitHub" },
      { "<leader>gh", ":OpenInGHFileLines<CR>", mode = "v", desc = "Open file with lines in GitHub" },
    },
  },
}
