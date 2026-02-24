return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
			globalstatus = false,
			inactive_sections = {},
			tabline = { "filename" },
			winbar = {},
		},
	},
}
