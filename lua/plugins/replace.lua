return {
	"chrisgrieser/nvim-rip-substitute",
	keys = {
		{
			"<leader>rs",
			function()
				require("rip-substitute").sub()
			end,
			mode = { "n", "x" },
			desc = " Rip Substitute",
		},
	},
	opts = {
		keymaps = {
			confirmAndSubstituteInBuffer = "<CR>",
			abort = "q",
		},
	},
}
