return {
	{
		lazy = false,
		priority = 1000,
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			-- Set up terminal based on OS
			if is_windows then
				vim.o.shell = "pwsh.exe"
				vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
				vim.o.shellquote = ""
				vim.o.shellxquote = ""
			end
			-- Keymap
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
			})
			-- LazyGit terminal settings
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				display_name = "LazyGit",
				direction = "float",
				float_opts = {
					border = "curved",
					width = 150,
					height = 40,
				},
			})
			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>g",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
