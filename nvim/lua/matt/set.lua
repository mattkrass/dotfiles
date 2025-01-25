vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.mapleader = " "
vim.g.neoformat_try_node_exe = 1
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.ts,*.js",
    command = "Neoformat prettier",
})
vim.g.CtrlSpaceDefaultMappingKey = "<C-space> "
vim.opt.splitbelow = true
vim.opt.splitright = true
