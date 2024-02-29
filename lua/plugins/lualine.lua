return {
    'nvim-lualine/lualine.nvim',
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
            lualine_x = {},
            lualine_y = {'encoding', 'fileformat', 'filetype'},
            lualine_z = {'progress'},
        },
    },
}
