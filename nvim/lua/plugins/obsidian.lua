if is_windows then
	return {
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "obsidian",
					path = "C:\\Projects\\Obsidian",
				},
			},
		},
	}
else
	return {
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "obsidian",
					path = "~/projects/obsidian",
				},
			},
		},
	}
end
