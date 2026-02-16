return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
						["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
					},
				},
			},
		})

		-- Load fzf extension for super fast searching
		telescope.load_extension("fzf")

		-- Keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd (Search)" })
		keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
	end,
}
