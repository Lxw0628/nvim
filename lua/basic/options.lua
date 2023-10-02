local opt = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
-- 行号
opt.relativenumber = true
opt.number = true
-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
-- 关闭自动换行
opt.wrap = false
-- 当光标到达屏幕边缘时，将自动扩展显示1/2屏幕的文本
opt.sidescroll = 1
-- 光标行
opt.cursorline = true
-- 启用鼠标
opt.mouse:append("a")
-- 系统剪贴板
opt.clipboard:append("unnamedplus")
-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true
-- 搜索
opt.ignorecase = true
opt.smartcase = true
-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- 屏幕滚动时上下保留5行预览
opt.scrolloff = 4

opt.showmode = false
opt.wildmenu = true
opt.autoread = true
opt.title = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 50
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
opt.exrc = true

-- Buffer Settings --
buffer.fileenconding = "utf-8"
