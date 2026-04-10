vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.foldlevelstart = 99
vim.opt.foldminlines = 5
vim.opt.fillchars = { fold = " " }

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.diagnostic.enable()
vim.diagnostic.config({
	virtual_lines = false,
})
