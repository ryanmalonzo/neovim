vim.api.nvim_create_user_command("CopyRelativePath", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative path" })
vim.cmd("cabbrev rel CopyRelativePath")

vim.api.nvim_create_user_command("CopyBuffer", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  vim.fn.setreg("+", table.concat(lines, "\n"))
  vim.notify("Buffer copied to clipboard", vim.log.levels.INFO)
end, { desc = "Copy buffer to clipboard" })
vim.cmd("cabbrev yb CopyBuffer")

vim.api.nvim_create_user_command("PasteBuffer", function()
  local lines = vim.split(vim.fn.getreg("+"), "\n")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.notify("Buffer replaced from clipboard", vim.log.levels.INFO)
end, { desc = "Paste from clipboard (replace buffer)" })
vim.cmd("cabbrev pb PasteBuffer")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  command = ":set cmdheight=1",
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  command = ":set cmdheight=0",
})
