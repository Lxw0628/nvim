-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ================================================== change default keymaps
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "跳转左边窗口", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "跳转下边窗口", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "跳转上边窗口", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "跳转右边窗口", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "增加窗口高度" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "减少窗口高度" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "减少窗口宽度" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "增加窗口宽度" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "上个buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "下个buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "上个buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "下个buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "上个buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "下个buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "上个buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "下个buffer" })
end
map("n", "<leader>bb", "<Nop>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<Nop>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "esc并清除高亮" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "重绘 / 清除高亮 / diff 更新" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "保存文件" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "调出man指南" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "打开Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "新建文件" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "位置列表" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "快速修复列表" })

if not Util.has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev, { desc = "上一个快速修复" })
  map("n", "]q", vim.cmd.cnext, { desc = "下一个快速修复" })
end

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "切换自动保存" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "切换拼写检查" })
map("n", "<M-z>", function() Util.toggle("wrap") end, { desc = "切换自动换行" })
map("n", "<leader>ul", function() Util.toggle_number() end, { desc = "切换显示行数" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "切换诊断" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "切换隐藏字符" })
if vim.lsp.inlay_hint then
map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "切换显示参数类型" })
end

-- lazygit
map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (根目录)" })
map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (当前工作目录)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "全部退出" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "高亮光标下" })
end

-- LazyVim Changelog
map("n", "<leader>L", Util.changelog, {desc = "LazyVim 变更记录"})

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
map("n", "<leader>ft", "<Nop>", { desc = "Terminal (root dir)" })
map("n", "<leader>fT", "<Nop>", { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "打开浮动终端" })
map("n", "<c-_>", "<Nop>", { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "隐藏浮动终端" })
map("t", "<c-_>", "<Nop>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "另一个窗口", remap = true })
map("n", "<leader>wc", "<C-W>c", { desc = "删除窗口", remap = true })
map("n", "<leader>wv", "<C-W>s", { desc = "垂直分割窗口", remap = true })
map("n", "<leader>wh", "<C-W>v", { desc = "水平分割窗口", remap = true })
map("n", "<leader>-", "<Nop>", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<Nop>", { desc = "Split window right", remap = true })
map("n", "<leader>wd", "<Nop>", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<Nop>", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<Nop>", { desc = "Split window right", remap = true })

-- tabs
-- del keymap
map("n", "<leader><tab>l", "<Nop>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<Nop>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<Nop>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<Nop>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<Nop>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<Nop>", { desc = "Previous Tab" })
-- new keymap
map("n", "<leader><tab>L", "<cmd>tablast<cr>", { desc = "最后的 Tab" })
map("n", "<leader><tab>H", "<cmd>tabfirst<cr>", { desc = "最初的 Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "新建 Tab" })
map("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "下一个 Tab" })
map("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "关闭 Tab" })
map("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "上一个 Tab" })
-- ==================================================

-- ================================================== personal keymaps
-- quick ESC
vim.keymap.set("i", "jk", "<ESC>")
-- kill buffer
vim.keymap.set("n", "<C-w>", "<Nop>")
vim.keymap.set("n", "<C-w>", "<Cmd>bd<CR>")
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
vim.keymap.set("i", "<C-h>", "<LEFT>")
vim.keymap.set("i", "<C-k>", "<UP>")
vim.keymap.set("i", "<C-j>", "<DOWN>")
vim.keymap.set("i", "<C-l>", "<RIGHT>")
-- 折叠
-- vim.keymap.set("n", "--", "zf")
-- TypeWriter mode
local typewriter_enable = false
vim.keymap.set("n", "<M-c>", "zz<Cmd>call v:lua.Toggle_typewriter()<CR>", { noremap = true, nowait = true })
function _G.Toggle_typewriter()
	typewriter_enable = not typewriter_enable
	if typewriter_enable then
		vim.keymap.set("n", "j", "gjzz", { silent = true })
		vim.keymap.set("n", "k", "gkzz", { silent = true })
		vim.keymap.set("i", "<CR>", "<CR><Esc>zzi", { noremap = true })
		print("TypeWriter is enable!")
	else
		vim.keymap.set("n", "j", "gj", { silent = true })
		vim.keymap.set("n", "k", "gk", { silent = true })
		vim.keymap.set("i", "<CR>", "<CR>", { noremap = true })
		print("TypeWriter is disable!")
	end
end
