return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function ()
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'lua', 'vim', 'vimdoc', 'bash', 'javascript', 'php', 'html', 'go' },

                auto_install = true,
                sync_install = false,

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
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<M-space>',
                    },
                },
            })
        end, 0)
    end
}
