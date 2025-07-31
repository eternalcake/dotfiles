vim.opt.number = true
vim.opt.relativenumber = true
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.wrap = true -- Wrap long line
vim.opt.textwidth = 120
vim.opt.linebreak = false -- Dont split words
vim.g.have_nerd_font = true
vim.opt.undofile = true -- Save undo history
vim.opt.cursorline = true
vim.opt.ignorecase = true -- Case insensitive
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 4 -- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.conceallevel = 0
vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.winborder = "rounded"

-- Set 2 tabs for specific files
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"yaml",
		"yml",
	},
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true
	end,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights on search when pressing <Esc>

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#3C4048", fg = "#16181A" })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
})
