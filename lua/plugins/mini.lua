return {
    {
        'echasnovski/mini.files',
        version = '*',
        config = function ()
            require('mini.files').setup({
                -- hides icons
                content = {
                    prefix = function() end
                },
                mappings = {
                    go_in_plus = '<CR>'
                }
            })

            vim.keymap.set('n', '<leader>E', function ()
                MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
            end)
        end,
    },
}
