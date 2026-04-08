vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    if vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
      vim.diagnostic.setloclist({ open = false })
    end
  end,
})
