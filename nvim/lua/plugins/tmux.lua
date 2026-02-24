return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<M-h>", "<cmd>vertical resize -5<cr>" },
			{ "<M-j>", "<cmd>resize +5<cr>" },
			{ "<M-k>", "<cmd>resize -5<cr>" },
			{ "<M-l>", "<cmd>vertical resize +5<cr>" },
		},
	},
}
