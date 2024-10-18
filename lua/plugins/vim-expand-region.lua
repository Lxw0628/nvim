return {
    {
        "terryma/vim-expand-region",
        keys = {
            { "v", "<Plug>(expand_region_expand)", { silent = true }, mode = { "v" } },
            { "V", "<Plug>(expand_region_shrink)", { silent = true }, mode = { "v" } },
        },
    },
}
