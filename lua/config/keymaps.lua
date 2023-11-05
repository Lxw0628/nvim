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

