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

-- floating terminal
-- local lazyterm = function()
--   LazyVim.terminal(nil, { cwd = LazyVim.root() })
-- end
-- vim.keymap.del("n", "<c-/>")
-- vim.keymap.del("t", "<C-/>")
-- vim.keymap.set("n", "<c-`>", lazyterm, { desc = "Terminal (root)" })
-- vim.keymap.set("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- TODO:状态栏codeium的图标显隐切换
vim.keymap.set("n", "<leader>uu", function()
  local cmp = require("cmp")
  local sources = cmp.get_config().sources
  local function isCodeiumEnabled()
    for _, v in ipairs(sources) do
      if v.name == "codeium" then
        return true
      end
    end
    return false
  end
  if isCodeiumEnabled() then
    for i = #sources, 1, -1 do
      if sources[i].name == "codeium" then
        table.remove(sources, i)
        vim.notify("Disabled codeium")
      end
    end
  else
    table.insert(sources, { name = "codeium", group_index = 1, priority = 100 })
    vim.notify("Enabled codeium")
  end
  cmp.setup.buffer({ sources = sources })
end, { desc = "Toggle Codeium" })

-- 反向打断
vim.keymap.set("n", "<S-M-j>", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local current_line = vim.fn.getline(".")
  local cursor_col = vim.fn.col(".")
  local before_cursor = string.sub(current_line, 1, cursor_col)
  local after_cursor = string.sub(current_line, cursor_col + 1)
  -- 删除当前行内容
  vim.api.nvim_set_current_line("")
  -- 插入两行
  vim.api.nvim_put({ before_cursor, after_cursor }, "", true, false)
  -- vim.api.nvim_put({ "", "" }, "b", true, false)
  -- 设置初始光标位置
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "打断" })

-- vim.keymap.set("v", "zz", function()
--   local select_start = vim.fn.line("'<")
--   local select_end = vim.fn.line("'>")
--   local select_center = math.floor((select_start + select_end) / 2)
--   -- 屏幕中间行
--   local line_center = vim.fn.line('winnrcenter(0)')
-- end, { desc = "Visual Center" })
