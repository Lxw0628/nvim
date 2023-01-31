local keyset = vim.keymap.set

keyset("v", "v", "<Plug>(expand_region_expand)", {silent = true})
keyset("v", "V", "<Plug>(expand_region_shrink)", {silent = true})
