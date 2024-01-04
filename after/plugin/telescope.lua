local fb_actions = require('telescope._extensions.file_browser.actions')

require('telescope').setup({
    extensions = {
        file_browser = {
            hijack_netrw = true,
            git_status = false,
            mappings = {
                ['i'] = {
                },
                ['n'] = {
                }
            },
            hidden = {
                file_browser = true
            }
        }
    }
})

require('telescope').load_extension('file_browser')

local builtin = require('telescope.builtin')

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({find_command = {'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!.git/' }})
end)

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pr', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.api.nvim_set_keymap(
  'n',
  '<space>pe',
  ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
  { noremap = true }
)
