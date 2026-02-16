return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim", -- Add the plugin here!
		},
		config = function()
			-- 1. Setup Mason
			require("mason").setup({
				ui = { border = "rounded" },
			})

			-- 2. Setup LSPs (The bridge)
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

			-- 3. Setup Linters & Formatters (The Tool Installer)
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

			-- 4. Configure & Enable LSPs (0.11 style)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

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
