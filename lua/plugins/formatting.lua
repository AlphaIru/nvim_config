return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofumpt" },
				sh = { "shfmt" },
				markdown = { "markdownlint-cli2" },
			},
			-- This makes it format the moment you save the file
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 2000,
			},
		})

		-- Optional: Manual format keybinding
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
