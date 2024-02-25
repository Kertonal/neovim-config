return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = false,
            theme = 'monokai-pro',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
            lualine_a = {'branch'},
            lualine_b = {'filename'},
            lualine_c = {},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
    },
}
