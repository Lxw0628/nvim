return {
  "nguyenvukhang/nvim-toggler",
  vscode = true,
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
      ["Top"] = "Bottom",
      ["top"] = "bottom",
      ["width"] = "height",
      ["start"] = "end",
      ["big"] = "small",
      ["max"] = "min",
      ["TRUE"] = "FALSE",
      ["0"] = "1",
      ["!=="] = "===",
      ["Left"] = "Right",
      ["Up"] = "Down",

      -- 中文
      ["男"] = "女",
      ["对"] = "错",
      ["是"] = "否",
      ["上"] = "下",
      ["左"] = "右",
    },
  },
}
