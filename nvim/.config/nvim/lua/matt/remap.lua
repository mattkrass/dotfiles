vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffer management
vim.keymap.set("n", "gb", "<cmd>bn<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "gB", "<cmd>bp<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "gX", "<cmd>bd<CR>", { desc = "Delete/close current buffer" })

-- Typo city
vim.api.nvim_create_user_command('W', ":w", {})
vim.api.nvim_create_user_command('Wq', ":wq", {})
vim.api.nvim_create_user_command('Wqa', ":wqa", {})

-- diff shortcuts
vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewFileHistory<CR>", { desc = "Open repository history" })
vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory --follow %<CR>", { desc = "Open file history" })
vim.keymap.set("n", "<leader>dr", "<esc><cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = "Open range history" })
vim.keymap.set("n", "<leader>dl", "<cmd>.DiffviewFileHistory --follow<CR>", { desc = "Open line history" })
vim.keymap.set("n", "<leader>di", "<cmd>DiffviewOpen<CR>", { desc = "Open index diff" })
vim.keymap.set("n", "<leader>dm", "<cmd>DiffviewOpen main<CR>", { desc = "Open main diff" })
vim.keymap.set("n", "<leader>dw", require("gitsigns").toggle_word_diff, { desc = "Toggle word diff" })
vim.keymap.set("n", "<leader>dL", require("gitsigns").toggle_linehl, { desc = "Toggle line highlight" })
vim.keymap.set("n", "<leader>dd", require("gitsigns").toggle_deleted, { desc = "Toggle deleted" })
vim.keymap.set("n", "<leader>dh", require("gitsigns").preview_hunk, { desc = "Toggle hunk preview" })
