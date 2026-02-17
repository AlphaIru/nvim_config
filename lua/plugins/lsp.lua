return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup({
				ui = { border = "rounded" },
			})

			local servers = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"pyright",
				"rust_analyzer",
				"gopls",
				"clangd",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"black",
					"prettier",
					"clang-format",
					"gofumpt",
					"flake8",
					"eslint_d",
					"golangci-lint",
					"codespell",
					"shfmt",
					"markdownlint",
					"json-lsp",
					"yaml-language-server",
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			for _, server in ipairs(servers) do
				if server ~= "lua_ls" then
					vim.lsp.config(server, { capabilities = capabilities })
				end
			end
			vim.lsp.enable(servers)

			-- 5. Keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
