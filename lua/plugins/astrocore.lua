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
