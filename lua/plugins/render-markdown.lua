return {
    {
        -- https://github.com/MeanderingProgrammer/render-markdown.nvim
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            bullet = {
                right_pad = 0,
            },
            checkbox = {
                -- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki/Checkboxes
                enabled = true,
                custom = {
                    todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
                    important = { raw = "[!]", rendered = " ", highlight = "DiagnosticWarn" },
                    remove = { raw = "[rm]", rendered = "󱟁 ", highlight = "Error", scope_highlight = "@markup.strikethrough" }
                },
                checked = {
                    scope_highlight = "@markup.strikethrough",
                },
            },
            heading = {
                sign = true,
                -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                signs = { "󰫎 " },
                width = "block",
                position = "inline",
            },
            html = {
                comment = {
                    conceal = false,
                },
            },
            link = {
                custom = {
                    -- TODO: 寻找合适的ICON
                    bilibili = { pattern = "bilibili%.com", icon = "B站 " },
                },
            },
            win_options = {
                conceallevel = { default = 0, rendered = 3 },
            },
        },
    },
}
