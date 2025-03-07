return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require('nvim-tree').setup({
            view = {
                width = 35,
                relativenumber = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            }
        })

        vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeFindFileToggle, { desc = "Toggle NvimTree find-file mode" })
    end,
}
