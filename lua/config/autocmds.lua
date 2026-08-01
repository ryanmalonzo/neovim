vim.api.nvim_create_user_command("CopyRelativePath", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative path" })
vim.cmd("cabbrev rel CopyRelativePath")

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
