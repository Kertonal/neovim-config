return {
    {
        'echasnovski/mini.files',
        version = '*',
        config = function ()
            require('mini.files').setup()

            vim.keymap.set('n', '<leader>E', function ()
                MiniFiles.open()
            end)
        end,
    },
}
