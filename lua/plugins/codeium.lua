return {
	"Exafunction/codeium.vim",
	lazy = false,
	init = function()
		vim.g.codeium_enabled = 1

		vim.g.codeium_no_map_tab = 1
		vim.g.codeium_disable_bindings = 1

		vim.g.codeium_manual = true
	end,
	config = function()
		local codeium_delay_ms = 500
		local codeium_timer = nil

		local function call_codeium(fn_name, ...)
			local ok, result = pcall(vim.fn[fn_name], ...)

			if ok and type(result) == "string" then
				return result
			end

			return ""
		end

		local function blink_visible()
			local ok, blink = pcall(require, "blink.cmp")

			if not ok then
				return false
			end

			if blink.is_visible and blink.is_visible() then
				return true
			end

			return false
		end

		local function clear_codeium()
			pcall(vim.fn["codeium#Clear"])
		end

		local function schedule_codeium()
			if codeium_timer then
				codeium_timer:stop()
				codeium_timer:close()
				codeium_timer = nil
			end

			clear_codeium()

			codeium_timer = vim.loop.new_timer()

			codeium_timer:start(
				codeium_delay_ms,
				0,
				vim.schedule_wrap(function()
					if codeium_timer then
						codeium_timer:stop()
						codeium_timer:close()
						codeium_timer = nil
					end

					if vim.api.nvim_get_mode().mode ~= "i" then
						return
					end

					if blink_visible() then
						return
					end

					pcall(vim.fn["codeium#Complete"])
				end)
			)
		end

		vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
			callback = function()
				schedule_codeium()
			end,
		})

		vim.api.nvim_create_autocmd({ "InsertLeave", "CompleteChanged" }, {
			callback = function()
				if codeium_timer then
					codeium_timer:stop()
					codeium_timer:close()
					codeium_timer = nil
				end

				clear_codeium()
			end,
		})

		vim.keymap.set("i", "<Tab>", function()
			local ok, blink = pcall(require, "blink.cmp")

			if ok and blink.is_visible and blink.is_visible() then
				blink.accept()
				return ""
			end

			return call_codeium("codeium#Accept")
		end, { expr = true, silent = true, replace_keycodes = true })

		vim.keymap.set("i", "<S-Tab>", function()
			local ok, blink = pcall(require, "blink.cmp")

			if ok and blink.is_visible and blink.is_visible() then
				blink.select_prev()
				return ""
			end

			return vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true)
		end, { expr = true, silent = true, replace_keycodes = true })

		vim.keymap.set("i", "<C-]>", function()
			return call_codeium("codeium#Clear")
		end, { expr = true, silent = true, replace_keycodes = true })

		vim.keymap.set("i", "<M-\\>", function()
			pcall(vim.fn["codeium#Complete"])
			return ""
		end, { expr = true, silent = true })
	end,
}
