return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- explorer = { enabled = true },
		notifier = { enabled = true },
		indent = {
			enable = true,
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "linear",
				duration = {
					step = 5, -- ms per step
					total = 10, -- maximum duration
				},
			},
		},
	},
}
