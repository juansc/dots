local lazygit = require('lazygit')
vim.keymap.set("n", "<leader>gg", function() lazygit.lazygit() end)
