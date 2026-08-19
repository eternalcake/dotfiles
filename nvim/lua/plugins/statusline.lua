return {

	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		mode_map =
			{
				["n"] = "N",
				["no"] = "O-PENDING",
				["nov"] = "O-PENDING",
				["noV"] = "O-PENDING",
				["no�"] = "O-PENDING",
				["niI"] = "N",
				["niR"] = "N",
				["niV"] = "N",
				["nt"] = "N",
				["v"] = "V",
				["vs"] = "V",
				["V"] = "V",
				["Vs"] = "V",
				["�"] = "V",
				["�s"] = "V",
				["s"] = "SELECT",
				["S"] = "S-LINE",
				["�"] = "S-BLOCK",
				["i"] = "I",
				["ic"] = "I",
				["ix"] = "I",
				["R"] = "REPLACE",
				["Rc"] = "REPLACE",
				["Rx"] = "REPLACE",
				["Rv"] = "V-REPLACE",
				["Rvc"] = "V-REPLACE",
				["Rvx"] = "V-REPLACE",
				["c"] = "C",
				["cv"] = "EX",
				["ce"] = "EX",
				["r"] = "REPLACE",
				["rm"] = "MORE",
				["r?"] = "CONFIRM",
				["!"] = "SHELL",
				["t"] = "T",
			}, require("lualine").setup({
				options = {
					extensions = { "lazy", "man", "oil", "toggleterm", "trouble" },
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = false,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16, -- ~60fps
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
              "TabEnter",
						},
					},
				},
				sections = {
					lualine_a = {
						function()
							return mode_map[vim.api.nvim_get_mode().mode] or "_"
						end,
					},
					lualine_b = { { "filetype", icon_only = true }, "filename" },
					lualine_c = {
						{
							"diff",
							symbols = { added = "", modified = "", removed = "" },
						},
					},
					lualine_x = {},
					lualine_y = {
						{ "diagnostics", symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						} },
						"lsp_status",
					},
					lualine_z = {
						"searchcount",
						"location",
					},
				},
				inactive_sections = {
					lualine_a = {
						function()
							return mode_map[vim.api.nvim_get_mode().mode] or "_"
						end,
					},
					lualine_b = { "filename" },
					lualine_c = {},
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					lualine_a = {
						{
							"tabs",
							mode = 1,
							use_mode_colors = true,
						},
					},
				},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
	end,
}
