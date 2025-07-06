return {
	{
		lazy = false,
		priority = 1000,
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
						width = { padding = 2 },
						height = { padding = 1 },
						preview_width = 0.6,
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
				-- extensions = {
				--   file_browser = {
				--     grouped = true,
				--     hidden = { file_browser = true, folder_browser = true },
				--   },
				-- },
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
	},
	-- {
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- },
}
