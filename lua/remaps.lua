vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<C-d>', '<C-d>M')
vim.keymap.set('n', '<C-u>', '<C-u>M')

vim.keymap.set({'n', 'v'}, '<C-e>', '3<C-e>')
vim.keymap.set({'n', 'v'}, '<C-y>', '3<C-y>')

-- disable search highlight until next search
vim.keymap.set('n', '<leader>/', ':noh<CR>')

-- yanking to the clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- yanking, deleting, and pasting with a {r}emembered register
vim.keymap.set({'n', 'v'}, '<leader>ry', [["ry]])
vim.keymap.set({'n', 'v'}, "<leader>rd", [["rd]])
vim.keymap.set('n', '<leader>rY', [["rY]])
vim.keymap.set('n', '<leader>rD', [["rD]])
vim.keymap.set({'n', 'v'}, '<leader>rp', [["rp]])
vim.keymap.set({'n', 'v'}, '<leader>rP', [["rP]])

-- paste without losing default yank register text
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '<leader>co', ':copen<CR>')
vim.keymap.set('n', '<leader>cq', ':cclose<CR>')
vim.keymap.set('n', '<leader>cn', ':cnext<CR>')
vim.keymap.set('n', '<leader>cp', ':cprev<CR>')

vim.keymap.set('n', '<leader>so', function()
    vim.cmd('so')
end)

-- setup highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
