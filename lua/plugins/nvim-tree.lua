return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
				number = true,
				relativenumber = true,
			},
			renderer = {
				highlight_git = true,
				indent_markers = {
					enable = true,
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			filters = {
				dotfiles = false,
			},
		})

		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle Explorer" })

		vim.keymap.set(
			"n",
			"<leader>ef",
			":NvimTreeFindFile<CR>",
			{ silent = true, desc = "Find current file in Explorer" }
		)
	end,
}
