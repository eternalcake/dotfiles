return {
	lazy = false,
	priority = 1000,
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						width = { padding = 0 },
						height = { padding = 0 },
						preview_height = 0.6,
						prompt_position = "top",
						mirror = true,
					},
				},
				-- TODO add windows/linux different slashes (win \\, lin /)
				file_ignore_patterns = {
					-- dirs
					".git\\",
					"__pycache__",
					-- files
					"%.exe",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				grep_string = {
					additional_args = { "--hidden" },
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
		})
		require("core.keymaps.telescope")
	end,
}
