return {
	lazy = false,
	priority = 1000,
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_format = "fallback",
		-- },
	},
	formatters = {
		isort = {
			command = "isort",
			args = { "--line-ending", "auto" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>t", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, { desc = "Code format" })
	end,
}
