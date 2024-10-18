return {
    {
        "voldikss/vim-translator",
        config = function()
            vim.keymap.set("n", "m", "<Plug>TranslateW")
            vim.keymap.set("v", "m", "<Plug>TranslateWV")
        end,
    },
}
