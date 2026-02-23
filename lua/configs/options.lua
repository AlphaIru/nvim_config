vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.diagnostic.enable()
vim.diagnostic.config({
	virtual_lines = false,
})
