for _, mode in ipairs({'n','i','v','x','s','o','c','t'}) do
  for _, keymap in ipairs(vim.api.nvim_get_keymap(mode)) do
    pcall(vim.api.nvim_del_keymap, mode, keymap.lhs)
  end
end

-- Default keymap options: non-recursive, silent
local opts = { noremap = true, silent = true }
-- Set global leader key
vim.g.mapleader = " "
-- Set local leader key
vim.g.maplocalleader = " "
-- Disable default <Space> behavior in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
-- Keep cursor centered when jumping to next search result
vim.keymap.set("n", "n", "nzzzv", opts)
-- Keep cursor centered when jumping to previous search result
vim.keymap.set("n", "N", "Nzzzv", opts)
-- Keep cursor centered after half-page down
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- Keep cursor centered after half-page up
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- Stay in visual mode after indenting left
vim.keymap.set("v", "<", "<gv", opts)
-- Stay in visual mode after indenting right
vim.keymap.set("v", ">", ">gv", opts)
-- Paste without overwriting yank register
vim.keymap.set("v", "p", '"_dP', opts)
-- Move selected lines down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
-- Move selected lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
-- Go to next tab with Ctrl+n
vim.keymap.set('n', '<C-n>', 'gt', { noremap = true, silent = true })
-- Go to previous tab with Ctrl+p
vim.keymap.set('n', '<C-p>', 'gT', { noremap = true, silent = true })
