-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

--
-- PLUGINS
--

-- Lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>lg", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit (Root Dir)" })

  -- LazyVim
  unmap("n", "<leader>gG")
  unmap("n", "<leader>gf")
  unmap("n", "<leader>gL")
end

-- oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--
-- CUSTOM
--

-- Copy whole file content
map("n", "<C-c>", "<cmd> %y+ <CR>")

-- Replace whole file content with clipboard
map("n", "<C-v>", "<cmd> %d | 0put+ <CR>")

-- Duplicate a line and comment out the first line
map("n", "yc", "yy<cmd>normal gcc<CR>p")
