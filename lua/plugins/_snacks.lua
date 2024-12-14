return {
    {
        "folke/snacks.nvim",
        opts = {
            -- https://github.com/folke/snacks.nvim/blob/main/docs/indent.md
            indent = {
                chunk = {
                    enabled = true,
                    char = {
                        -- corner_top = "┌",
                        -- corner_bottom = "└",
                        corner_top = "╭",
                        corner_bottom = "╰",
                        horizontal = "─",
                        vertical = "│",
                        arrow = ">",
                    },
                },
            },
        },
    },
}
