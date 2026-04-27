return {
  {
    "nvim-neotest/neotest",
    cmd = "Neotest",
    keys = {
      {
        "<leader>tt",
        function()
          local neotest = require("neotest")
          neotest.output_panel.clear()
          neotest.output_panel.open()
          neotest.run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tf",
        function()
          local neotest = require("neotest")
          neotest.output_panel.clear()
          neotest.output_panel.open()
          neotest.run.run(vim.fn.expand("%"))
        end,
        desc = "Run test file",
      },
    },
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({}),
          require("neotest-vitest"),
        },
        status = {
          signs = true,
          virtual_text = true,
        },
        output = {
          enabled = true,
          open_on_run = "short",
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 12",
        },
      })
    end,
  },
}
