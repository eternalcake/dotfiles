return {
	lazy = false,
	priority = 1000,
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.keymap.set({ "n", "v" }, "<leader>t", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, { desc = "Code format" })
	end,
}
