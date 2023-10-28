vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Allows moving a visual selection up or down
-- Does not work well when reaching the top or
-- bottom of the buffer
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search terms are centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Hitting leader+p will keep the current selection in
-- the buffer instead of replacing it with whatever you pasted over
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>trn", ":set relativenumber!<CR>")
