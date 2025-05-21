vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v'}, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts) -- center search
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('v', '<', '<gv', opts) -- stay in indent mode
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('v', 'p', '"_dP', opts) -- keep last yanked