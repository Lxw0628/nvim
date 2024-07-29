-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map({ "i", "n", "x" }, "<C-M-h>", "<Home>")
map({ "i", "n", "x" }, "<C-M-j>", "<Down><Down><Down><Down><Down>")
map({ "i", "n", "x" }, "<C-M-k>", "<Up><Up><Up><Up><Up>")
map({ "i", "n", "x" }, "<C-M-l>", "<End>")
