return {
    'Darazaki/indent-o-matic',
    { 'mbbill/undotree', event = 'VeryLazy' },
    { 'ray-x/lsp_signature.nvim', event = 'InsertEnter' },
    {
        'sindrets/diffview.nvim',
        event = 'VeryLazy',
        config = {
            use_icons = false
        }
    },
}
