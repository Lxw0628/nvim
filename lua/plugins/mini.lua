return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
        require("mini.ai").setup()
        require("mini.align").setup()
        require("mini.basics").setup({
            mappings = {
                -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
                -- Supply empty string to not create these mappings.
                option_toggle_prefix = "",
                -- Window navigation with <C-hjkl>, resize with <C-arrow>
                windows = true,
            },
        })
        require("mini.bufremove").setup()
        require("mini.comment").setup({
            mappings = {
                comment = "<leader>/",
                comment_line = "<leader>/",
                textobject = "<leader>/",
            },
        })
        require("mini.cursorword").setup()
        require("mini.jump").setup({
            mappings = {
                repeat_jump = "",
            },
        })
        require("mini.surround").setup()
    end,

}
