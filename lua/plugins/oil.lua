return {
  {
    "stevearc/oil.nvim",
    version = "v2.15.0",
    dependencies = { { "nvim-mini/mini.icons", version = "v0.17.0" } },
    lazy = false,
    cond = not vim.g.vscode,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    config = function()
      require("mini.icons").setup()
      require("oil").setup({
        default_file_explorer = true,
        icons = {
          provider = "mini.icons",
        },
        view_options = {
          show_hidden = false,
        },
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
          if event.data.err then
            return
          end
          for _, action in ipairs(event.data.actions) do
            if action.type == "move" then
              Snacks.rename.on_rename_file(action.src_url, action.dest_url)
            end
          end
        end,
      })
    end,
  },
}
