return {
  {
    "saghen/blink.cmp",
    version = "v1.9.1",
    dependencies = { { "rafamadriz/friendly-snippets", version = "572f5660cf05f8cd8834e096d7b4c921ba18e175" } },
    event = { "InsertEnter", "CmdlineEnter" },
    cond = not vim.g.vscode,
    config = function()
      require("blink.cmp").setup({
        keymap = { preset = "default" },
        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
      })
    end,
  },
}
