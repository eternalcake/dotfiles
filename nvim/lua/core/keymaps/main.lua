vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts) -- center search
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("v", "<", "<gv", opts) -- stay in indent mode
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "p", '"_dP', opts) -- keep last yanked

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
