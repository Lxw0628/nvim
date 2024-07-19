---@type LazySpec
return {
  "voldikss/vim-translator",
  keys = {
    { "m", mode = { "n" }, "<Plug>TranslateW", desc = "Translate in Normal mode" },
    { "m", mode = { "v" }, "<Plug>TranslateWV", desc = "Translate in Visual mode" },
  }
}
