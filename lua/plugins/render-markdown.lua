return {
    {
        -- https://github.com/MeanderingProgrammer/render-markdown.nvim
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            bullet = {
                right_pad = 1,
            },
            checkbox = {
                -- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki/Checkboxes
                enabled = true,
                custom = {
                    todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
                    important = { raw = "[~]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
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
        },
    },
}
