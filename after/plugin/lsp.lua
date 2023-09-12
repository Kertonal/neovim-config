local lsp = require('lsp-zero').preset({
    name = 'recommended'
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})

    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end
end)

-- this removes unnecessary warnings in neovim config
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'intelephense',
    'lua_ls',
    'cssls',
    'pyright',
    'html',
    'bashls'
})

require('lspconfig').intelephense.setup({
    init_options = {
        licenceKey = os.getenv('HOME') .. '/intelephense/license.txt'
    }
})

require('lspconfig').dartls.setup({
    cmd = { "dart", "language-server", "--protocol=lsp" },
});

lsp.setup()

-- tab completion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- require('luasnip.loaders.from_vscode').lazy_load()
-- require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    }
})

require("lsp_signature").setup();
