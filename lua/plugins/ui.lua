return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        config = true,
        -- opts = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "goolord/alpha-nvim",
        -- event = "VeryLazy",
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end
    },
}
