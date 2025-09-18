return {
    "matze/vim-move",
    event = { "InsertEnter" },
    specs = {
        {
            "nvim-mini/mini.move",
            optional = true,
            enabled = false,
        },
    },
}
