return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])

            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                }
            })
            -- === evil_lualine ===
            require("barbecue").setup({
                theme = "tokyonight",
            })
        end,
    },
}
