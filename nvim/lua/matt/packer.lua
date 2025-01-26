-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'Mofiqul/dracula.nvim'
    use "ellisonleao/gruvbox.nvim"
    use 'tomasr/molokai'
    use {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup()
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    -- use('tpope/vim-fugitive')
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- LSP Stuff
    use('neovim/nvim-lspconfig')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('williamboman/mason.nvim')

    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }
    use('sbdchd/neoformat')
    use('folke/trouble.nvim')
    use('vim-ctrlspace/vim-ctrlspace')
    use('nvim-tree/nvim-tree.lua')
    use {
        'NeogitOrg/neogit',
        requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
        config = function()
            require('neogit').setup {}
        end,
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup {}
        end,
    }
    use {
        'akinsho/bufferline.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use('rmagatti/auto-session')
    use('stevearc/dressing.nvim')
end)
