return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Configurations
        vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })

        -- Enablements
        vim.lsp.enable('clangd')
        vim.lsp.enable('cmake')
        vim.lsp.enable('eslint')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('markdown_oxide')
        vim.lsp.enable('pyright')
        vim.lsp.enable('ruff')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('typescript-tools')
        vim.lsp.enable('yamlls')
    end,
}
