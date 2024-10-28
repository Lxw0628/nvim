-- if true then return {} end

return {
    "nvim-lualine/lualine.nvim",
    opts = {
        sections = {
            lualine_y = {
                function()
                    return vim.api.nvim_call_function("codeium#GetStatusString", {})
                end,
                { "progress", separator = " ", padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },
        },
    },
}
