return {
	"folke/trouble.nvim",
	opts = {
		auto_preview = false, -- automatically open preview when on an item
		follow = false, -- Follow the current item
		icons = {
			-- ---@type trouble.Indent.symbols
			indent = {
				top = "│ ",
				middle = "├╴",
				last = "╰╴", -- rounded
			},
			-- indent = {
			-- 	middle = " ",
			-- 	last = " ",
			-- 	top = " ",
			-- 	ws = "│  ",
			-- },
		},
		modes = {
			diagnostics = {
				groups = {
					{ "filename", format = "{file_icon} {basename:Title} {count}" },
				},
			},
			diagnostics_buffer = {
				mode = "diagnostics", -- inherit from diagnostics mode
				filter = { buf = 0 }, -- filter diagnostics to the current buffer
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
	},
}
