local opt = vim.opt

opt.number = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false

opt.splitright = true
opt.splitbelow = true

opt.undofile = true
opt.swapfile = false

opt.updatetime = 250
opt.timeoutlen = 300

vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

opt.mouse = "a"
opt.showmode = false
opt.inccommand = "split"
opt.showtabline = 0
