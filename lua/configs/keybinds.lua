vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<C-S-Down>", "<C-d>")
vim.keymap.set("n", "<C-S-Up>", "<C-u>")

vim.keymap.set("n", "<C-Down>", "5j")
vim.keymap.set("n", "<C-Up>", "5k")

vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>d", "d", { noremap = true, silent = true })

vim.keymap.set("i", " ", " <C-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { noremap = true })
vim.keymap.set("i", ",", ",<C-g>u", { noremap = true })
vim.keymap.set("i", ";", ";<C-g>u", { noremap = true })
vim.keymap.set("i", ")", ")<C-g>u", { noremap = true })
vim.keymap.set("i", "}", "}<C-g>u", { noremap = true })
vim.keymap.set("i", "]", "]<C-g>u", { noremap = true })
vim.keymap.set("i", "<CR>", "<CR><C-g>u", { noremap = true })

vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo in insert mode" })

vim.keymap.set("n", "<C-y>", "<C-r>", { desc = "Redo" })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { desc = "Redo in insert mode" })
