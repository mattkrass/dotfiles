return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require('nvim-tree').setup({
            view = {
                width = 35,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    quit_on_open = true,
                    window_picker = {
                        enable = false,
                    },
                },
            },
        })

        vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeFindFileToggle, { desc = "Toggle NvimTree find-file mode" })
    end,
}
