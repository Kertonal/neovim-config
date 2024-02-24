vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy_bootstrap')
require('lazy_setup')
require('set')
require('remaps')
require('telescope_setup')
require('treesitter_setup')
require('lsp_setup')
require('cmp_setup')
require('harpoon_setup')
