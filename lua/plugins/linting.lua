return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- 1. Map linters to filetypes
		lint.linters_by_ft = {
			python = { "flake8" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			go = { "golangci-lint" },
			markdown = { "markdownlint" },
			json = { "jsonlint" },
			cpp = { "cppcheck" },
			c = { "cppcheck" },
		}

		-- 2. Create an autocmd to trigger linting
		-- This runs linting when you save, enter a buffer, or leave insert mode
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- 3. Optional: Manual lint keybinding
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
