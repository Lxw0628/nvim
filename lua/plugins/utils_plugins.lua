return {
  {
    "terryma/vim-expand-region",
    keys = {
      { "v", "<Plug>(expand_region_expand)", { silent = true }, mode = { "v" } },
      { "V", "<Plug>(expand_region_shrink)", { silent = true }, mode = { "v" } },
    },
    config = function()
      vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { silent = true })
      vim.keymap.set("v", "V", "<Plug>(expand_region_shrink)", { silent = true })
    end,
  },
  {
    "voldikss/vim-translator",
    config = function()
      vim.keymap.set("n", "m", "<Plug>TranslateW")
      vim.keymap.set("v", "m", "<Plug>TranslateWV")
    end,
  },
}
