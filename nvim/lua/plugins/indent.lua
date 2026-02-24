return {
  lazy = false,
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = { char = "▏" },
		viewport_buffer = { min = 100 },
		scope = { show_start = false, show_end = false },
	},
}
