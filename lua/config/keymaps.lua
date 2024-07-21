-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("n", "<C-M-h>", "0")
map("n", "<C-M-j>", "5j")
map("n", "<C-M-k>", "5k")
map("n", "<C-M-l>", "$")
map("i", "<C-M-h>", "0")
map("i", "<C-M-j>", "5j")
map("i", "<C-M-k>", "5k")
map("i", "<C-M-l>", "$")
