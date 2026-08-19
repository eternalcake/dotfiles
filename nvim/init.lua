if vim.g.vscode then
else
	require("keymap")
	require("options")
	require("plugins.lazy")
	require("lazy").setup({
		{
			require("plugins.colortheme"),
			require("plugins.treesitter"),
			require("plugins.telescope"),
			require("plugins.indent"),
			require("plugins.lsp.lsp"),
			require("plugins.terminal"),
			require("plugins.comment"),
			require("plugins.oil"),
			require("plugins.autocompletion"),
			require("plugins.conform"),
			require("plugins.statusline"),
			require("plugins.tmux"),
			require("plugins.gitsigns"),
			require("plugins.figutive"),
			require("plugins.trouble"),
			require("plugins.neogit"),
			require("plugins.diffview"),
			require("plugins.statusline2"),
			require("plugins.noice"),
			require("plugins.notify"),

			-- require("plugins.codecompanion"),
		},
	}, {
		ui = {
			border = "rounded",
			throttle = 1000 / 8,
		},
	})
end
