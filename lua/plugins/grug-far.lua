return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
    end,
    keys = {
      {
        "<leader>sr",
        function()
          require("grug-far").open()
        end,
        mode = { "n", "x" },
        desc = "Search and Replace",
      },
      {
        "<leader>sR",
        function()
          require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
        end,
        desc = "Search and Replace (Current File)",
      },
      {
        "<leader>sW",
        function()
          require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
        end,
        desc = "Search and Replace (Word)",
      },
    },
  },
}
