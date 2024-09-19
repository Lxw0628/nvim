return {
  "Wansmer/treesj",
  vscode = true,
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  init = function ()
    vim.keymap.set("n", "<Leader>m", "<Cmd>TSJToggle<CR>", {desc = "Toggle Treesitter Join"})
  end,
  opts = {
    use_default_keymaps = false,
  },
}
