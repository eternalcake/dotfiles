return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    local smart_splits = require("smart-splits")

    smart_splits.setup({
      default_amount = 5,
    })

    -- переключение сплита
    vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
    vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
    vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
    vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)

    -- ресайз: Cmd+Shift+h/j/k/l
    vim.keymap.set("n", "<A-H>", smart_splits.resize_left)
    vim.keymap.set("n", "<A-J>", smart_splits.resize_down)
    vim.keymap.set("n", "<A-K>", smart_splits.resize_up)
    vim.keymap.set("n", "<A-L>", smart_splits.resize_right)
  end,
}
