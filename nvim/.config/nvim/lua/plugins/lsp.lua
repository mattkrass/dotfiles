return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-java/nvim-java",
    },
    config = function()
        -- Reserve a space in the gutter
        vim.opt.signcolumn = 'yes'

        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- This is where you enable features that only work
        -- if there is a language server active in the file
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        --- pyright doesn't dynamically recognize a virtualenv, so we have to help it
        local path = require('lspconfig/util').path
        local function get_python_path(workspace)
            -- Use activated virtualenv.
            if vim.env.VIRTUAL_ENV then
                local result = path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
                print('in venv logic, result =', result)
                return result
            end

            -- Find and use virtualenv in workspace directory.
            for _, pattern in ipairs({ '*', '.*' }) do
                local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
                if match ~= '' then
                    return path.join(path.dirname(match), 'bin', 'python')
                end
            end
        end

        -- You'll find a list of language servers here:
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        -- These are example language servers.
        require('lspconfig').gleam.setup({})
        require('lspconfig').clangd.setup({})
        require('lspconfig').cmake.setup({})
        require('lspconfig').docker_compose_language_service.setup({})
        require('lspconfig').eslint.setup({})
        require('lspconfig').groovyls.setup {
            cmd = { "java", "-jar", path.join(
                vim.env.HOME,
                ".local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar"
            ) },
        }
        require('lspconfig').lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
        require('lspconfig').markdown_oxide.setup({})
        require('lspconfig').ruff.setup({})
        require('lspconfig').rust_analyzer.setup({})
        require('lspconfig').pyright.setup({
            before_init = function(_, config)
                config.settings.python.pythonPath = get_python_path(config.root_dir)
            end
        })
        require('lspconfig').yamlls.setup({})
        require('typescript-tools').setup({})
        require('lspconfig').jdtls.setup({})

        local cmp = require('cmp')

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
            },
            snippet = {
                expand = function(args)
                    -- You need Neovim v0.10 to use vim.snippet
                    vim.snippet.expand(args.body)
                end,
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
        })

        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            pattern = "*",
            callback = function()
                for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                    if vim.api.nvim_win_get_config(winid).zindex then
                        return
                    end
                end
                vim.diagnostic.open_float({
                    scope = "cursor",
                    focusable = false,
                    close_events = {
                        "CursorMoved",
                        "CursorMovedI",
                        "BufHidden",
                        "InsertCharPre",
                        "WinLeave",
                    },
                })
            end
        })
    end,
}
