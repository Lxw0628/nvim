-- if true then return {} end

return {
    -- https://github.com/VidocqH/lsp-lens.nvim
    "VidocqH/lsp-lens.nvim",
    opts = {
        enable = true,
        include_declaration = true, -- Reference include declaration
        sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
            definition = function(count)
                return "定义: " .. count
            end,
            references = function(count)
                return "引用: " .. count
            end,
            implements = function(count)
                return "实现: " .. count
            end,
            git_authors = function(latest_author, count)
                return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
            end,
        },
        ignore_filetype = {
            "prisma",
        },
    },
}
