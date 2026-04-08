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
    "Almo7aya/openingh.nvim",
    version = "v1.0.14",
    keys = {
      { "<leader>gh", "<cmd>OpenInGHFile<cr>", desc = "Open file in GitHub" },
      { "<leader>gh", ":OpenInGHFileLines<CR>", mode = "v", desc = "Open file with lines in GitHub" },
    },
  },
}
