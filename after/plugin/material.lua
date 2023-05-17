require('material').setup({
    plugins = {
        'gitsigns',
        'nvim-cmp',
        'telescope'
    },
    custom_colors = function(colors)
        colors.git.added    = '#27e002'
        colors.git.modified = '#f8fc0d'
    end
})

vim.cmd('colorscheme material')
