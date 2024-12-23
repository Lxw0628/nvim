return {
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            heading = {
                sign = true,
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                signs = { "󰫎 " },
                width = "block",
                position = "inline",
            },
            bullet = {
                right_pad = 1,
            },
        },
    },
}
