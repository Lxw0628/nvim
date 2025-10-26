if true then return {} end

return {
    {
        "yetone/avante.nvim",
        opts = {
            provider = "deepseek",
            providers = {
                deepseek = {
                    __inherited_from = "openai",
                    -- api_key_name = "DEEPSEEK_API_KEY",
                    endpoint = "https://api.deepseek.com",
                    model = "deepseek-coder",
                },
            },
        },
    },
}
