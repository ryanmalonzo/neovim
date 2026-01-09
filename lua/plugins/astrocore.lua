---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      diagnostics = { virtual_text = true, virtual_lines = false },
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
      g = {},
    },
    mappings = {
      n = {
        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<Leader>b"] = { desc = "Buffers" },

        -- copy relative path
        ["<Leader>fy"] = {
          function()
            local path = vim.fn.expand "%:."
            vim.fn.setreg("+", path)
            vim.notify("Copied: " .. path, vim.log.levels.INFO)
          end,
          desc = "Copy relative path",
        },

        -- copy whole buffer to clipboard
        ["<C-c>"] = {
          function()
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            local content = table.concat(lines, "\n")
            vim.fn.setreg("+", content)
            vim.notify("Buffer copied to clipboard", vim.log.levels.INFO)
          end,
          desc = "Copy buffer to clipboard",
        },

        -- paste from clipboard, replacing whole buffer
        ["<C-v>"] = {
          function()
            local content = vim.fn.getreg "+"
            local lines = vim.split(content, "\n")
            vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
            vim.notify("Buffer replaced from clipboard", vim.log.levels.INFO)
          end,
          desc = "Paste from clipboard (replace buffer)",
        },

        -- lazygit
        ["<Leader>tl"] = false,
        ["<Leader>lg"] = {
          function() Snacks.lazygit.open() end,
          desc = "Open lazygit",
        },

        -- oil.nvim
        ["<Leader>O"] = false,
        ["-"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
      },
    },
  },
}
