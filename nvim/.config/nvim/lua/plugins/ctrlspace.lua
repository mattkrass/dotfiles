return {
    "vim-ctrlspace/vim-ctrlspace",
    priority = 1000,
    config = function()
        -- set up key mapping
        vim.g.CtrlSpaceDefaultMappingKey = "<C-Space> "
        vim.keymap.set("n", "<Space><Space>", "<cmd>CtrlSpace<CR>", { desc = "Open CtrlSpace" })
    end
}
