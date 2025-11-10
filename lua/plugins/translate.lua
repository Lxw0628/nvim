if true then return {} end

return {
    {
        "uga-rosa/translate.nvim",
        keys = {
            { "<leader>ms", "viw:Translate zh-CN<CR>" },
            { "<leader>ms", ":'<,'>Translate zh-CN<CR>", mode = "v" },
            { "<leader>mr", "viw:Translate zh-CN -output=replace<CR>" },
            { "<leader>mr", ":'<,'>Translate zh-CN<CR> -output=replace<CR>", mode = "v" },
        },
        opts = {
            default = {
                command = "translate_shell",
            },
            preset = {
                command = {
                    translate_shell = {
                        args = { "-e", "bing" },
                    },
                },
            },
        },
    },
}
