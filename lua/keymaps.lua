-- Diagnostics
vim.keymap.set("n", "<leader>xx", vim.diagnostic.setloclist, { desc = "Diagnostics loclist" })

-- Auto-refresh location list when diagnostics change
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    -- Only update if location list is currently open
    if vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
      vim.diagnostic.setloclist({ open = false })
    end
  end,
})

-- Copy relative path
vim.keymap.set("n", "<Leader>cr", function()
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

-- opencode.nvim
vim.keymap.set({ "n", "x" }, "<leader>oa", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode" })

vim.keymap.set({ "n", "x" }, "<leader>ox", function()
  require("opencode").select()
end, { desc = "Opencode actions" })

vim.keymap.set({ "n", "t" }, "<leader>oo", function()
  require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "<leader>ov", function()
  return require("opencode").operator("@this ")
end, { desc = "Add range to opencode", expr = true })

vim.keymap.set("n", "<leader>ol", function()
  return require("opencode").operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<leader>ob", function()
  require("opencode").prompt("@buffer")
end, { desc = "Add buffer to opencode" })

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "terminal" then
      return
    end
    local name = vim.api.nvim_buf_get_name(args.buf)
    if name:match("opencode%s+%-%-port") then
      vim.cmd.startinsert()
    end
  end,
})

-- smart-splits.nvim
if vim.fn.executable("tmux") == 1 then
  -- resizing splits
  vim.keymap.set({ "n", "t" }, "<A-h>", require("smart-splits").resize_left)
  vim.keymap.set({ "n", "t" }, "<A-j>", require("smart-splits").resize_down)
  vim.keymap.set({ "n", "t" }, "<A-k>", require("smart-splits").resize_up)
  vim.keymap.set({ "n", "t" }, "<A-l>", require("smart-splits").resize_right)
  -- moving between splits
  vim.keymap.set({ "n", "t" }, "<C-h>", require("smart-splits").move_cursor_left)
  vim.keymap.set({ "n", "t" }, "<C-j>", require("smart-splits").move_cursor_down)
  vim.keymap.set({ "n", "t" }, "<C-k>", require("smart-splits").move_cursor_up)
  vim.keymap.set({ "n", "t" }, "<C-l>", require("smart-splits").move_cursor_right)
  vim.keymap.set({ "n", "t" }, "<C-\\>", require("smart-splits").move_cursor_previous)
  -- swapping buffers between windows
  vim.keymap.set({ "n", "t" }, "<leader><leader>h", require("smart-splits").swap_buf_left)
  vim.keymap.set({ "n", "t" }, "<leader><leader>j", require("smart-splits").swap_buf_down)
  vim.keymap.set({ "n", "t" }, "<leader><leader>k", require("smart-splits").swap_buf_up)
  vim.keymap.set({ "n", "t" }, "<leader><leader>l", require("smart-splits").swap_buf_right)
end
