return {
	"folke/noice.nvim",
	event = "VeryLazy",
	-- dependencies = {
	-- 	"rcarriga/nvim-notify",
	-- },
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline",
		},
		messages = {
			enabled = false,
		},
	},
	popupmenu = {
		enabled = false,
	},
	notify = {
		enabled = false,
	},
	lsp = {
		progress = {
			enabled = false,
		},
		hover = {
			enabled = false,
		},
		signature = {
			enabled = false,
		},
		message = {
			enabled = false,
		},
		override = {
			-- Prevent overriding markdown rendering for documentation engines
			["vim.lsp.util.convert_input_to_markdown_lines"] = false,
			["vim.lsp.util.stylize_markdown"] = false,
			["cmp.entry.get_documentation"] = false,
		},
	},
	health = {
		checker = false, -- Disable if you don't want health checks to run
	},
}
