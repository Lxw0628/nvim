-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- quick ESC
vim.keymap.set("i", "jk", "<ESC>")
-- quick move
vim.keymap.set("n", "<C-M-h>", "0")
vim.keymap.set("n", "<C-M-j>", "5j")
vim.keymap.set("n", "<C-M-k>", "5k")
vim.keymap.set("n", "<C-M-l>", "$")
vim.keymap.set("i", "<C-M-h>", "<HOME>")
vim.keymap.set("i", "<C-M-j>", "<DOWN><DOWN><DOWN><DOWN><DOWN>")
vim.keymap.set("i", "<C-M-k>", "<UP><UP><UP><UP><UP>")
vim.keymap.set("i", "<C-M-l>", "<END>")
vim.keymap.set("v", "<C-M-h>", "0")
vim.keymap.set("v", "<C-M-j>", "5j")
vim.keymap.set("v", "<C-M-k>", "5k")
vim.keymap.set("v", "<C-M-l>", "$")
-- move cursor in insert mode
vim.keymap.set("i", "<C-k>", "<Nop>")
vim.keymap.set("i", "<C-h>", "<LEFT>")
vim.keymap.set("i", "<C-k>", "<UP>")
vim.keymap.set("i", "<C-j>", "<DOWN>")
vim.keymap.set("i", "<C-l>", "<RIGHT>")

vim.keymap.set("n", "<leader>uu", function()
  local cmp = require("cmp")
  local sources = cmp.get_config().sources
  local function isCodeiumEnabled()
    for _, source in ipairs(sources) do
      if source.name == "codeium" then
        return true
      end
    end
    return false
  end
  for i = #sources, 1, -1 do
    if isCodeiumEnabled() then
      if sources[i].name == "codeium" then
        table.remove(sources, i)
        vim.notify("Disabled codeium")
      end
    else
      sources[#sources + 1] = { name = "codeium", group_index = 1, priority = 100 }
        vim.notify("Enabled codeium")
    end
  end
  cmp.setup.buffer({ sources = sources })
end, { desc = "Toggle codeium" })
