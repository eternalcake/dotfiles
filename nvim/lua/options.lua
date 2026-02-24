-- Show absolute line numbers
vim.opt.number = true
-- Show relative line numbers
vim.opt.relativenumber = true
-- Wrap long lines
vim.opt.wrap = true
-- Do not break words when wrapping
vim.opt.linebreak = false
-- Enable Nerd Font detection
vim.g.have_nerd_font = true
-- Save undo history to a file
vim.opt.undofile = true
-- Highlight the current line
vim.opt.cursorline = true
-- Ignore case in searches
vim.opt.ignorecase = true
-- Override ignorecase if search contains uppercase
vim.opt.smartcase = true
-- Always show sign column
vim.opt.signcolumn = "yes"
-- Keep lines visible above/below cursor when scrolling
vim.opt.scrolloff = 10
-- Number of spaces for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Number of spaces a tab counts for
vim.opt.tabstop = 4
-- Number of spaces for <Tab> in insert mode
vim.opt.softtabstop = 4
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Show concealed text normally
vim.opt.conceallevel = 0
-- Set window border style
vim.opt.winborder = "rounded"
-- Enable true color support
vim.opt.termguicolors = true
-- Clear search highlight when pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Set 2-space indentation for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "yaml", "yml" },
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true
	end,
})
-- Use system clipboard for copy/paste
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- vim.o.laststatus = 0

windows = vim.loop.os_uname().sysname == "Windows_NT"
