-- if true then return {} end

return {
    {
        "saghen/blink.cmp",
        opts = {
            sources = {
                -- default = { "snippets", "lsp", "path", "buffer" },

                providers = {
                    snippets = {
                        score_offset = 0,
                    },
                },
            },
        },
    },
}
