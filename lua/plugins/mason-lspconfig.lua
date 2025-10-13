return {
  "mason-org/mason-lspconfig.nvim",
  cond = not vim.g.vscode,
  opts = {
    ensure_installed = { "lua_ls", "vtsls" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
