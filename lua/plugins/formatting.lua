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
				html = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofumpt" },
				sh = { "shfmt" },
				markdown = { "markdownlint" },
				["*"] = { "codespell" },
			},
			-- This makes it format the moment you save the file
			format_on_save = {
				lsp_fallback = true, -- If the formatter fails, try LSP formatting
				async = false,
				timeout_ms = 500,
			},
		})

		-- Optional: Manual format keybinding
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
