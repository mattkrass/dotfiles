return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    lazy = false,
    config = function()
        require('bufferline').setup({
            options = {
                separator_style = 'slant',
            }
        })
        vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#191a21", bg = "#1e1f28" })

        -- buffer management
        vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer to focus" })
        vim.keymap.set("n", "gB", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
        vim.keymap.set("n", "gX", "<cmd>bdelete<CR>", { desc = "Delete/close current buffer" })
    end,
}
