return {
  "junegunn/vim-easy-align",
  event = "VeryLazy",
  config = function()
    vim.keymap.set({ "n", "x" }, "gl", "<Plug>(EasyAlign)")
  end,
}
