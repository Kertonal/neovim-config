return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'bash',
                    'go',
                    'html',
                    'javascript',
                    'jsdoc',
                    'json',
                    'lua',
                    'php',
                    'phpdoc',
                    'vim',
                    'vimdoc',
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
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
