return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach", -- LSPが起動した時に読み込む
		priority = 1000, -- 他のUI系より優先して読み込み
		config = function()
			require("tiny-inline-diagnostic").setup({
				-- オプションが必要な場合はここに記述
				preset = "modern",
			})
		end,
	},
}
