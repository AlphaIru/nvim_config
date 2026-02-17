return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			local auto_dark_mode = require("auto-dark-mode")
			auto_dark_mode.setup({
				update_interval = 1000,
				set_dark_mode = function()
					vim.api.nvim_set_option_value("background", "dark", {})
					vim.cmd("colorscheme tokyonight-storm")
				end,
				set_light_mode = function()
					vim.api.nvim_set_option_value("background", "light", {})
					vim.cmd("colorscheme tokyonight-day")
				end,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "auto",
			},
		},
	},
}
