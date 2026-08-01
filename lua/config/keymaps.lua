-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-c>", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, "\n")
  vim.fn.setreg("+", content)
  vim.notify("Buffer copied to clipboard", vim.log.levels.INFO)
end, { desc = "Copy buffer to clipboard" })

vim.keymap.set("n", "<C-v>", function()
  local content = vim.fn.getreg("+")
  local lines = vim.split(content, "\n")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.notify("Buffer replaced from clipboard", vim.log.levels.INFO)
end, { desc = "Paste from clipboard (replace buffer)" })
