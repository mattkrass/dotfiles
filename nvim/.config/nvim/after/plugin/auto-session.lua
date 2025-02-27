require('auto-session').setup {}

vim.keymap.set("n", "<leader>wr", vim.cmd.SessionRestore, { desc = "Restore session" })
vim.keymap.set("n", "<leader>ws", vim.cmd.SessionSave, { desc = "Save session" })
