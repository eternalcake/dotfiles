return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		debounce = 100,
		indent = { char = "▏" },
		viewport_buffer = { min = 50 },
		scope = { show_start = false, show_end = false },
	},
}
