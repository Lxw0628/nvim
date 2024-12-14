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
        keys = {
            { "<c-/>", "<Nop>" },
            {
                "<c-`>",
                function()
                    Snacks.terminal()
                end,
                desc = "Toggle Terminal",
            },
        },
    },

    -- LSP-integrated file renaming with support for plugin neo-tree.nvim
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = function(_, opts)
            local function on_move(data)
                Snacks.rename.on_rename_file(data.source, data.destination)
            end
            local events = require("neo-tree.events")
            opts.event_handlers = opts.event_handlers or {}
            vim.list_extend(opts.event_handlers, {
                { event = events.FILE_MOVED, handler = on_move },
                { event = events.FILE_RENAMED, handler = on_move },
            })
        end,
    },
}
