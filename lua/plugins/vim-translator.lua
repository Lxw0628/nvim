return {
    {
        "voldikss/vim-translator",
        config = function()
            vim.keymap.set("n", "<leader>m", "<Plug>TranslateW")
            vim.keymap.set("v", "<leader>m", "<Plug>TranslateWV")
        end,
    },
}
