-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("i", "jk", "<Esc>")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map({ "i", "n", "x" }, "<C-M-h>", "^")
map({ "i", "n", "x" }, "<C-M-j>", "L")
map({ "i", "n", "x" }, "<C-M-k>", "H")
map({ "i", "n", "x" }, "<C-M-l>", "$")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- map({ "i", "n", "x" }, "<C-d>", "<C-d>zz", opts)
-- map({ "i", "n", "x" }, "<C-u>", "<C-u>zz", opts)
-- map({ "i", "n", "x" }, "<C-i>", "<C-i>zz", opts)
-- map({ "i", "n", "x" }, "<C-o>", "<C-o>zz", opts)

map("t", "<C-/>", "<Nop>")
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

if not vim.g.vscode then
    -- BufferLineMove
    map("n", "<leader>bj", "<Cmd>BufferLineMoveNext<CR>")
    map("n", "<leader>bk", "<Cmd>BufferLineMovePrev<CR>")
end

map("i", "<C-CR>", function()
    -- 退出插入模式并插入新行
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>o", true, false, true), "n", true)
end, { desc = "Insert a new line below", silent = true })
