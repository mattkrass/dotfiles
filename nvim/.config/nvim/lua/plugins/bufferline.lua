return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    lazy = false,
    opts = {
        options = {
            mode = 'tabs',
            separator_style = 'slant',
        }
    },
    keys = {
        -- { "gt", "<cmd>bn<CR>", desc = "Next buffer" },
        -- { "gT", "<cmd>bp<CR>", desc = "Previous buffer" },
    }
}
