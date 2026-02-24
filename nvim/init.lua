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

			require("plugins.lsp"),
			require("plugins.terminal"),
      -- require("plugins.obsession"),

			require("plugins.autocompletion"),
			require("plugins.conform"),
			-- require("plugins.statusline"),
      require("plugins.tmux"),
      require("plugins.obsidian"),
			-- require("plugins.noice"),
		},
	}, {
		ui = {
			border = "rounded",
			throttle = 1000 / 8,
		},
	})
end
