return {
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
                update_n_lines = "gsn",
            },
        },
    },
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
}
