return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0", -- stable version
	opts = {
		enabled = true, -- start auto-save when the plugin is loaded
		trigger_events = { -- See :h events
			immediate_save = { "BufLeave", "FocusLost" }, -- save when you switch windows
			defer_save = { "InsertLeave", "TextChanged" }, -- delay save after typing
			cancel_deferred_save = { "InsertEnter" }, -- don't save while I'm still typing
		},
		-- This is your "afterDelay" (in milliseconds)
		debounce_delay = 1000, -- Save 1 second after last change
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")
			-- Don't save for special filetypes (like the Lazy UI or Git commits)
			if
				fn.getbufvar(buf, "&modifiable") == 1
				and utils.not_in(fn.getbufvar(buf, "&filetype"), { "gitcommit", "netrw" })
			then
				return true
			end
			return false
		end,
	},
}
