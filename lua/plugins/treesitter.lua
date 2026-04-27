local parsers = {
  "lua",
  "prisma",
  "vim",
  "vimdoc",
  "markdown",
  "markdown_inline",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "html",
  "css",
  "yaml",
}

local filetypes = {
  "lua",
  "prisma",
  "vim",
  "markdown",
  "javascript",
  "typescript",
  "typescriptreact",
  "javascriptreact",
  "json",
  "html",
  "css",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-treesitter").setup({})
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
