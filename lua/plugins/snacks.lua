return {
  {
    "folke/snacks.nvim",
    version = "v2.30.0",
    priority = 1000,
    lazy = false,
    cond = not vim.g.vscode,
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gp",
        function()
          Snacks.picker.gh_pr({ state = "all" })
        end,
        desc = "GitHub PRs (all)",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent Files",
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "<leader>fS",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
    },
    config = function()
      require("snacks").setup({
        lazygit = { enabled = true },
        picker = { enabled = true },
        rename = { enabled = true },
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
      })
    end,
  },
}
