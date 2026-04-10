local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.rustlsp("codeaction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeaction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "<leader>xr", function()
	vim.cmd.RustLsp("relatedDiagnostics")
end, { silent = true, buffer = bufnr })
vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		require("rustaceanvim.hover_actions").hover_actions()
	end,
	{ silent = true, buffer = bufnr }
)
