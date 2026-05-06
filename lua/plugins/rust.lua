return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	ft = { "rust" },
	init = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, { buffer = bufnr, silent = true })

					vim.keymap.set("n", "<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, { buffer = bufnr, silent = true, desc = "Rust runnables" })

					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("debuggables")
					end, { buffer = bufnr, silent = true, desc = "Rust debuggables" })
				end,
			},
		}
	end,
}
