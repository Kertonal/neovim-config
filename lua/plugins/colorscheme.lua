return {
    -- 'loctvl842/monokai-pro.nvim',
    -- priority = 1000,
    -- config = function()
    --     require('monokai-pro').setup()
    --     require('monokai-pro').load()
    -- end,
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup()
            require('tokyonight').load()
            -- vim.cmd[[colorscheme tokyonight]]
        end
    }
}
