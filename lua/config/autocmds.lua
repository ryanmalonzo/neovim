vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if vim.o.background == "light" then
      vim.cmd.colorscheme("catppuccin-latte")
    else
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    if vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
      vim.diagnostic.setloclist({ open = false })
    end
  end,
})
