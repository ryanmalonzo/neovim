---@type LazySpec
return {
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
      },
    },
  },
}
