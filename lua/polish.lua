local map = vim.keymap.set

-- general mappings
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole file content
map("n", "<C-v>", "<cmd> %d | 0put+ <CR>") -- replace whole file content with clipboard

-- duplicate a line and comment out the first line
map("n", "yc", "yy<cmd>normal gcc<CR>p")
