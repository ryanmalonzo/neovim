local mason_tools = {
  "biome",
  "eslint",
  "eslint_d",
  "lua_ls",
  "prettierd",
  "prisma-language-server",
  "stylua",
  "terraformls",
  "tailwindcss",
}

if vim.fn.executable("nix") == 1 then
  table.insert(mason_tools, "nil_ls")
end

return {
  {
    "mason-org/mason.nvim",
    version = "v2.2.1",
    cond = not vim.g.vscode,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    version = "v2.1.0",
    dependencies = { "mason-org/mason.nvim" },
    cond = not vim.g.vscode,
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    commit = "517ef5994ef9d6b738322664d5fdd948f0fdeb46",
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
    cond = not vim.g.vscode,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = mason_tools,
        run_on_start = true,
        integrations = {
          ["mason-lspconfig"] = true,
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    version = "v2.6.0",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      require("config.lsp")
    end,
  },
}
