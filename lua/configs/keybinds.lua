vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<C-S-Down>", "<C-d>")
vim.keymap.set("n", "<C-S-Up>", "<C-u>")

vim.keymap.set("n", "<C-Down>", "5j")
vim.keymap.set("n", "<C-Up>", "5k")

vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "x", '"_x', { noremap = true, silent = true })

vim.keymap.set("i", " ", " <C-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { noremap = true })
vim.keymap.set("i", ",", ",<C-g>u", { noremap = true })
vim.keymap.set("i", ";", ";<C-g>u", { noremap = true })
vim.keymap.set("i", ")", ")<C-g>u", { noremap = true })
vim.keymap.set("i", "}", "}<C-g>u", { noremap = true })
vim.keymap.set("i", "]", "]<C-g>u", { noremap = true })
vim.keymap.set("i", "<CR>", "<CR><C-g>u", { noremap = true })

vim.keymap.set("n", "<leader>u", "u", { desc = "Undo" })

vim.keymap.set("n", "<leader>r", "<C-r>", { desc = "Redo" })
