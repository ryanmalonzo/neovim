return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  cond = not vim.g.vscode,
  opts = {
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = true,
    },
  },
}
