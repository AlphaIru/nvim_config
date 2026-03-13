return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

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

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				local ft = vim.bo.filetype
				local linter_names = lint.linters_by_ft[ft] or {}

				local valid_linters = {}
				for _, name in ipairs(linter_names) do
					local linter = lint.linters[name]
					if linter and vim.fn.executable(linter.cmd) == 1 then
						table.insert(valid_linters, name)
					end
				end

				if #valid_linters > 0 then
					lint.try_lint(valid_linters)
				end
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
