return {
	"stevearc/oil.nvim",
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		lsp_file_methods = { enabled = false },
		watch_for_changes = true,
		skip_confirm_for_simple_edits = false,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { horizontal = true } },
			-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = { "actions.preview", opts = { horizontal = true } },
			-- ["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			-- ["gx"] = "actions.open_external",
			-- ["g."] = { "actions.toggle_hidden", mode = "n" },
			-- ["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		use_default_keymaps = false,
		view_options = {
			show_hidden = true,
		},
		preview_win = {
			update_on_cursor_moved = true,
			-- "load"|"scratch"|"fast_scratch"
			preview_method = "fast_scratch",
		},
		confirmation = { border = "rounded" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
