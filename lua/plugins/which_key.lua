return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300 -- ポップアップが出るまでの時間（ミリ秒）
		end,
		opts = {
			-- アイコンやデザインの設定（デフォルトで十分使えます）
		},
	},
}
