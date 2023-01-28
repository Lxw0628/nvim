vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- 单行或多行移动
keymap.set("i", "<M-j>", "<ESC>:m .+1<CR>i<RIGHT>")
keymap.set("i", "<M-k>", "<ESC>:m .-2<CR>i<RIGHT>")

-- 快速移动
keymap.set("i", "<C-M-j>", "<DOWN><DOWN><DOWN><DOWN><DOWN>")
keymap.set("i", "<C-M-k>", "<UP><UP><UP><UP><UP>")
keymap.set("i", "<C-M-h>", "<HOME>")
keymap.set("i", "<C-M-l>", "<END>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "M-j", "m '<-2<cr>gv")
keymap.set("v", "M-k", "m '<-2<cr>gv")

-- 快速移动
keymap.set("n", "<C-M-j>", "5j")
keymap.set("n", "<C-M-k>", "5k")
keymap.set("n", "<C-M-h>", "0")
keymap.set("n", "<C-M-l>", "$")

-- ---------- 正常模式 ---------- ---
-- 保存关闭
keymap.set("n", "<leader>w", "<ESC>:w<CR>")
keymap.set("n", "<leader>q", "<ESC>:q!<CR>")

-- 单行或多行移动
keymap.set("n", "<M-j>", ":m .+1<cr>")
keymap.set("n", "<M-k>", ":m .-2<cr>")

-- 快速移动
keymap.set("n", "<C-M-j>", "5j")
keymap.set("n", "<C-M-k>", "5k")
keymap.set("n", "<C-M-h>", "0")
keymap.set("n", "<C-M-l>", "$")

-- 窗口
-- keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
-- keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 快速滚动居中
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- 全选
keymap.set("n", "<M-a>", "ggVG")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<M-l>", ":bnext<CR>")
keymap.set("n", "<M-h>", ":bprevious<CR>")
keymap.set("n", "<M-w>", ":bw<CR>")

-- 换行wrap
-- keymap.set("n", "<M-z>", "set wrap", {  })

-- ---------- 插件 ---------- ---
-- nvim-tree
local opts = {silent = true, nowait = true}
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- coc-explorer
-- keymap.set("n", "<leader>e", "<Cmd>CocCommand explorer<CR>", opts)
