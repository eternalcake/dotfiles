return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
    -- bg = "#16181a",
    -- bg_alt = "#1e2124",
    -- bg_highlight = "#3c4048",
    -- fg = "#ffffff",
    -- grey = "#7b8496",
    -- blue = "#5ea1ff",
    -- green = "#5eff6c",
    -- cyan = "#5ef1ff",
    -- red = "#ff6e5e",
    -- yellow = "#f1ff5e",
    -- magenta = "#ff5ef1",
    -- pink = "#ff5ea0",
    -- orange = "#ffbd5e",
    -- purple = "#bd5eff",

    opts = {
    -- Set light or dark variant
    variant = "dark", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
    -- Enable transparent background
    transparent = true,
    -- Reduce the overall saturation of colours for a more muted look
    saturation = 1,
    -- Enable italics comments
    italic_comments = true,
    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,
    -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
    borderless_pickers = false,
    -- Set terminal colors used in `:terminal`
    terminal_colors = true,
    -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
    cache = false,
    -- Override highlight groups with your own colour values
    highlights = {
        -- Highlight groups to override, adding new groups is also possible
        -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
				Search = { fg = "#1e2124", bg = "#5ea1ff", italic = true },
				CurSearch = { fg = "#1e2124", bg = "#ffbd5e", italic = true },
				IncSearch = { fg = "#1e2124", bg = "#ffbd5e", italic = true },
				YankHighlight = { fg = "#16181A", bg = "#3C4048", italic = false },
    },
    -- Disable or enable colorscheme extensions
    extensions = {
    },
  
},
		config = function(_, opts)
			require("cyberdream").setup(opts)
			vim.cmd("colorscheme cyberdream")
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
				end,
			})
		end,
}
}

