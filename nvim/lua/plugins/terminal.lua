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
				open_mapping = [[<D-\>]],
				direction = "float",
        float_opts ={
          border = "curved",
          width = 140,
          height = 35,
        }
			})
		end,
	},
}
