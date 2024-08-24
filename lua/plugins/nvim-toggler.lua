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
    inverses = {
      ["- [ ]"] = "- [x]",
      ["horizontal"] = "vertical",
      ["top"] = "bottom",
      ["width"] = "height",
      ["big"] = "small",
      ["TRUE"] = "FALSE",
      ["0"] = "1",
      ["!=="] = "===",

      -- 中文
      ["男"] = "女",
      ["对"] = "错",
      ["是"] = "否",
      ["上"] = "下",
      ["左"] = "右",
    },
  },
}
