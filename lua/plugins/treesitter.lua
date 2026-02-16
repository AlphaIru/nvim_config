return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- Use 'main' instead of 'master'
		branch = "main",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"c",
				"cpp",
				"python",
				"html",
				"css",
				"javascript",
				"typescript",
				"go",
				"rust",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			-- The NEW way: just call the main module's setup
			require("nvim-treesitter").setup(opts)
		end,
	},
}
