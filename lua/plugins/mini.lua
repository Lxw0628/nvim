-- Set to `false` to prevent "non-lsp snippets"" from appearing inside completion windows
-- Motivation: Less clutter in completion windows and a more direct usage of snippits
-- vim.g.lazyvim_mini_snippets_in_completion = true

return {
    {
        "echasnovski/mini.comment",
        opts = {
            mappings = {
                -- Toggle comment on current line
                comment_line = "<C-/>",
                -- Toggle comment on visual selection
                comment_visual = "<C-/>",
            },
        },
    },
    {
        -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-snippets.md#expand
        "echasnovski/mini.snippets",
        opts = {
            mappings = {
                expand = "<C-'>",
                jump_next = "<C-.>",
                jump_prev = "<C-,>",
            },
        },
    },
}
