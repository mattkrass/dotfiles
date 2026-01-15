return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Configurations
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' }, -- Explicitly tell the server that 'vim' is a global variable
                    },
                    workspace = {
                        checkThirdParty = false,
                        -- Adds Neovim's runtime files to the workspace library for better accuracy
                        library = {
                            vim.env.VIMRUNTIME,
                            -- You can add other plugin directories here if needed
                            -- vim.fn.stdpath('config') .. '/lua/plugins',
                        },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            }
        })

        -- Enablements
        vim.lsp.enable('bashls')
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

        -- Keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP Keymaps",
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.definition()<cr>")
            end,
        })
    end,
}
