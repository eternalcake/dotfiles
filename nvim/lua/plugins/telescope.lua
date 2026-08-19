return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "v0.2.1",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
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
				file_ignore_patterns = {
					".git\\",
					".git/",
					"__pycache__",
					"%.mkv",
					"%.mp4",
					"%.o",
					"%.exe",
					"%.bmp",
					"%.dll",
					"%.pyd",
					"%.png",
					"%.xlsx",
					"%.pak",
					"%.bin",
					"%.jpg",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					mappings = {
						i = {
							["<D-CR>"] = require("telescope.actions").select_tab,
						},
					},
				},
				grep_string = {
					additional_args = { "--hidden" },
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
	end,
}
