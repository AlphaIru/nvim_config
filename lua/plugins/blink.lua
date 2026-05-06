return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "default",

				["<CR>"] = { "accept", "fallback" },

				["<Down>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },

				["<Esc>"] = { "hide", "fallback" },
			},

			completion = {
				menu = {
					auto_show = true,
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				ghost_text = {
					enabled = true,
				},
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
