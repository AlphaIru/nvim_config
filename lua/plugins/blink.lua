return {
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<Esc>"] = { "hide", "fallback" },
				["<Tab>"] = { "select_and_accept", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
			},

			completion = {
				list = {
					selection = {
						auto_insert = true,
						preselect = true,
					},
				},
			},

			appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
