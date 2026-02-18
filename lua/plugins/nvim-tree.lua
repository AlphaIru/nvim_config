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
			},
			-- 便利なオプション（お好みで）
			filters = {
				dotfiles = false,
			},
		})

		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
	end,
}
