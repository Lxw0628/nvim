return {
  "nguyenvukhang/nvim-toggler",
  event = { "User AstroFile", "InsertEnter" },
  init = function()
    vim.keymap.set("n", "<Leader>i", function()
      require("nvim-toggler").toggle()
    end, { desc = "Toggle CursorWord" })
    vim.keymap.set("v", "<Leader>i", function()
      require("nvim-toggler").toggle()
    end, { desc = "Toggle CursorWord" })
  end,
  opts = {
    remove_default_keybinds = true,
  },
}
