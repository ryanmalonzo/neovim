-- Copy relative path
vim.keymap.set("n", "<Leader>fy", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative path" })

-- Copy whole buffer to clipboard
vim.keymap.set("n", "<C-c>", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, "\n")
  vim.fn.setreg("+", content)
  vim.notify("Buffer copied to clipboard", vim.log.levels.INFO)
end, { desc = "Copy buffer to clipboard" })

-- Paste from clipboard, replacing whole buffer
vim.keymap.set("n", "<C-v>", function()
  local content = vim.fn.getreg("+")
  local lines = vim.split(content, "\n")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.notify("Buffer replaced from clipboard", vim.log.levels.INFO)
end, { desc = "Paste from clipboard (replace buffer)" })
