return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'lua',
                    'vim',
                    'vimdoc',
                    'bash',
                    'javascript',
                    'jsdoc',
                    'json',
                    'php',
                    'phpdoc',
                    'html',
                    'go',
                },

                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { 'php' }, -- regex highlighting is required for php indenting
                },
                indent = {
                    enable = true,

                    -- treesitter indenting is broken for these languages
                    disable = { 'php', 'dart' },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        node_incremental = '<C-space>',
                        node_decremental = '<M-space>',
                    },
                },
            })
        end, 0)
    end
}
