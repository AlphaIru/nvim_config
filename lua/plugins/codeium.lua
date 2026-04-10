return {
	"Exafunction/codeium.vim",
	lazy = false,
	config = function()
		-- 1. Codeiumを有効化
		vim.g.codeium_enabled = 1

		-- 2. Codeiumが勝手にTabキーを使わないようにする (重要!)
		-- これをしないと blink.cmp の Tab 確定とぶつかります
		vim.g.codeium_no_map_tab = 1

		-- 3. Codeium専用の確定キーを設定 (例: Ctrl + g)
		-- 薄い字が出た時はこれでガバッと取り込みます
		vim.keymap.set("i", "<M-a>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		-- 4. おまけ: 候補の切り替え (Alt + ] / [) も設定しておくと便利です
		vim.keymap.set("i", "<M-]>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<M-[>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
	end,
}
