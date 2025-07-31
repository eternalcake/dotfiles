if vim.g.vscode then
else
	require("core.keymaps.main")
	require("core.options")

	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			error("Error cloning lazy.nvim:\n" .. out)
		end
	end ---@diagnostic disable-next-line: undefined-field
	vim.opt.rtp:prepend(lazypath)

	is_windows = vim.loop.os_uname().sysname == "Windows_NT"

	require("lazy").setup({
		{
			require("plugins.telescope"),
			require("plugins.colortheme"),
			require("plugins.column"),
			require("plugins.treesitter"),
			require("plugins.terminal"),
			require("plugins.lsp"),
			require("plugins.autocompletion"),
			require("plugins.comment"),
			require("plugins.conform"),
			require("plugins.obsidian"),
			require("plugins.snacks"),
			require("plugins.markdown"),
		},
	}, {
		ui = {
			border = "rounded",
		},
	})
end
