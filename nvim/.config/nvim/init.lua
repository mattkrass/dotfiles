vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	"https://github.com/Mofiqul/dracula.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/rmagatti/auto-session",
	"https://github.com/akinsho/toggleterm.nvim",
	"https://github.com/Civitasv/cmake-tools.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/spacedentist/resolve.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-mini/mini.move",
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/folke/which-key.nvim",
})

-- simple setup calls
require("dracula").setup({ italic_comment = true })
require("resolve").setup()
require("gitsigns").setup()
require("mini.move").setup()
require("nvim-surround").setup()
require("tiny-inline-diagnostic").setup()
-- Disable Neovim's default virtual text diagnostics
vim.diagnostic.config({ virtual_text = false })

-- colorschme
vim.cmd.colorscheme("dracula")

-- keybindings
vim.keymap.set({ "n" }, "<leader>lg", vim.cmd.LazyGit, { desc = "Open LazyGit" })

-- Typo city
vim.api.nvim_create_user_command("Qa", ":qa", {})
vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Wq", ":wq", {})
vim.api.nvim_create_user_command("Wqa", ":wqa", {})
