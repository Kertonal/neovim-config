return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },
    config = function ()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        luasnip.config.setup({
            history = true,
            updateevents = 'TextChanged,TextChangedI',
            ft_func = function ()
               return require("luasnip.extras.filetype_functions").from_cursor_pos()
            end
        })

        require('luasnip.loaders.from_lua').load({ paths = { './snippets' } })

        -- Opens luasnip choice node items in select window
        vim.keymap.set('i', '<C-u>', '<cmd>lua require("luasnip.extras.select_choice")()<CR>');

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-Space>'] = cmp.mapping.complete({}),
                ['<C-y'] = cmp.mapping.confirm({ select = true }),
                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
                ['<C-j>'] = cmp.mapping(function()
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    end
                end, { 'i', 's' }),
                ['<C-k>'] = cmp.mapping(function()
                    if luasnip.choice_active() then
                        luasnip.change_choice(-1)
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            },
        })
    end
}
