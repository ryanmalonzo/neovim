local languages = {
  "css",
  "dockerfile",
  "html",
  "javascript",
  "json",
  "jsx",
  "lua",
  "markdown",
  "nix",
  "prisma",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(languages)

      local language_to_filetype = {
        jsx = "javascriptreact",
        tsx = "typescriptreact",
      }

      local filetypes = vim.tbl_map(function(lang)
        return language_to_filetype[lang] or lang
      end, languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
