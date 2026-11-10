return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")

		-- setup debugpy
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		-- keymaps
		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<F12>", dap.step_out)
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		vim.keymap.set("n", "<Leader>dr", dap.repl.open)
		vim.keymap.set("n", "<Leader>dl", dap.run_last)

		-- optional custom configs
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch current file",
				program = "${file}",
				pythonPath = function()
					return vim.fn.exepath("python")
				end,
			},

			{
				type = "python",
				request = "launch",
				name = "Launch with arguments",
				program = "${file}",
				args = function()
					local input = vim.fn.input("Args: ")
					return vim.split(input, " ")
				end,
				pythonPath = function()
					return vim.fn.exepath("python")
				end,
			},

			{
				type = "python",
				request = "attach",
				name = "Attach remote",
				connect = {
					host = "127.0.0.1",
					port = 5678,
				},
			},
		}
	end,
}
