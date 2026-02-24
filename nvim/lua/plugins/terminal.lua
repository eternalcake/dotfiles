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
				direction = "float",
        float_opts ={
          border = "curved",
          width = 160,
          height = 40,
        }
			})
		end,
	},
}
