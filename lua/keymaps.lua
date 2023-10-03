-- leader 键
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<ESC>", opts)
-- 插入模式下移动光标
vim.keymap.set("i", "<C-h>", "<LEFT>", opts)
vim.keymap.set("i", "<C-j>", "<DOWN>", opts)
vim.keymap.set("i", "<C-k>", "<UP>", opts)
vim.keymap.set("i", "<C-l>", "<RIGHT>", opts)
-- 快速移动
vim.keymap.set("n", "<C-M-j>", "5j", opts)
vim.keymap.set("n", "<C-M-k>", "5k", opts)
vim.keymap.set("n", "<C-M-h>", "0", opts)
vim.keymap.set("n", "<C-M-l>", "$", opts)
vim.keymap.set("i", "<C-M-j>", "<DOWN><DOWN><DOWN><DOWN><DOWN>", opts)
vim.keymap.set("i", "<C-M-k>", "<UP><UP><UP><UP><UP>", opts)
vim.keymap.set("i", "<C-M-h>", "<HOME>", opts)
vim.keymap.set("i", "<C-M-l>", "<END>", opts)
vim.keymap.set("v", "<C-M-j>", "5j", opts)
vim.keymap.set("v", "<C-M-k>", "5k", opts)
vim.keymap.set("v", "<C-M-h>", "0", opts)
vim.keymap.set("v", "<C-M-l>", "$", opts)
-- 折行移动
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
-- 单行挪动
vim.keymap.set("n", "<M-j>", ":m .+1<cr>", opts)
vim.keymap.set("n", "<M-k>", ":m .-2<cr>", opts)
-- 分割屏幕
vim.keymap.set("n", "<leader>wh", "<C-w>v", opts)
vim.keymap.set("n", "<leader>wv", "<C-w>s", opts)
vim.keymap.set("n", "<leader>wc", "<C-w>c", opts)
-- 取消c-w分屏操作
vim.keymap.set("n", "<C-w>v", "<Nop>", opts)
vim.keymap.set("n", "<C-w>s", "<Nop>", opts)
-- buffer操作
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<C-w>", ":bd<CR>", opts)
-- 保存关闭
vim.keymap.set("n", "<C-s>", ":w<cr>", opts)
vim.keymap.set("n", "<leader>q", "<ESC>:q!<CR>", opts)
-- 快速滚动居中
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- 取消高亮
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", opts)
-- 切换自动换行 Alt+z
vim.keymap.set(
    "n",
    "<M-z>",
    "&wrap == 1 ? ':set nowrap<cr>' : ':set wrap<cr>'",
    { noremap = true, expr = true }
)
local typewriter_enable = false
vim.keymap.set("n", "<M-c>", "zz<Cmd>call v:lua.Toggle_typewriter()<CR>", opts)
function _G.Toggle_typewriter()
    typewriter_enable = not typewriter_enable
    if typewriter_enable then
        vim.keymap.set("n", "j", "gjzz", opts)
        vim.keymap.set("n", "k", "gkzz", opts)
        vim.keymap.set("i", "<CR>", "<CR><Esc>zzi", opts)
    else
        vim.keymap.set("n", "j", "gj", opts)
        vim.keymap.set("n", "k", "gk", opts)
        vim.keymap.set("i", "<CR>", "<CR>", opts)
    end
end
