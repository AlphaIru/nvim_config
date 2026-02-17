return {
	-- 構造ナビゲーション
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
		opts = { lsp = { auto_attach = true } },
	},

	-- 高機能置換
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
