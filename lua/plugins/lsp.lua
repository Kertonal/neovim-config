return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        { 'j-hui/fidget.nvim', opts = {} },

        -- improves editing neovim config and plugin development
        'folke/neodev.nvim',
    },
    config = function ()
        local on_attach = function(_, bufnr)
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', function ()
                require('telescope.builtin').lsp_definitions({
                    show_line = false
                })
            end, '[G]oto [D]efinition')

            nmap('gr', function ()
                require('telescope.builtin').lsp_references({
                    show_line = false
                })
            end, '[G]oto [R]eferences')

            nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

            -- show all doc symbols
            nmap('<leader>ds', function ()
                require('telescope.builtin').lsp_document_symbols({
                    symbol_width = 50,
                })
            end, '[D]ocument [S]ymbols')

            -- show only functions & methods doc symbols
            nmap('<leader>df', function ()
                require('telescope.builtin').lsp_document_symbols({
                    symbol_width = 50,
                    symbols = {
                        'function',
                        'method',
                    }
                })
            end, '[D]ocument [F]unctions')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            -- nmap('<leader>wl', function()
            --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        -- mason-lspconfig requires that these setup functions are called in this order
        -- before setting up the servers.
        require('mason').setup()
        require('mason-lspconfig').setup()

        local servers = {
            tsserver = {},
            html = { filetypes = { 'html', 'twig', 'hbs'} },

            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = { disable = { 'missing-fields' } },
                },
            },
        }

        -- Setup neovim lua configuration
        require('neodev').setup()

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require('mason-lspconfig')

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        })

        require('lspconfig').intelephense.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            init_options = {
                licenceKey = os.getenv('HOME') .. '/intelephense/license.txt'
            }
        })

        require('lspconfig').dartls.setup({
            capabilities = capabilities,
            on_attach = on_attach
        });

        require('lsp_signature').setup();
    end
}
