return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
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
      })
    end,
  },
}
