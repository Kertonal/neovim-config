return {
    'tpope/vim-fugitive',
    config = function ()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        vim.keymap.set('n', '<leader>Gu', ':G push<CR>')
        vim.keymap.set('n', '<leader>Go', ':G pull --rebase<CR>')
    end
}
