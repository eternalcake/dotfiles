return {
	"nickjvandyke/opencode.nvim",
	version = "*",
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			server = {},
		}

		vim.o.autoread = true

		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ")
		end, { desc = "Ask OpenCode…" })
		vim.keymap.set({ "n", "x" }, "<leader>os", function()
			require("opencode").select()
		end, { desc = "Select OpenCode…" })
		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { desc = "Append range to OpenCode", expr = true })
		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Append line to OpenCode", expr = true })
		vim.keymap.set("n", "<S-C-u>", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll OpenCode up" })
		vim.keymap.set("n", "<S-C-d>", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll OpenCode down" })

		-- Автозапуск OpenCode в текущей директории при старте Neovim
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- Загрузка модуля спровоцирует готовность плагина
				local opencode = require("opencode")
				-- Если требуется точный старт сервера до первого промпта:
				if opencode.server and opencode.server.start then
					opencode.server.start()
				end
			end,
		})
	end,
}
