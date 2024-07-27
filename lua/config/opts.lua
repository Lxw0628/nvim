-- 启用鼠标
vim.opt.mouse:append("a")
-- 系统剪贴板
vim.opt.clipboard:append("unnamedplus")
-- 默认新窗口右和下
vim.opt.splitright = true
vim.opt.splitbelow = true
-- 外观
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 命令行数
-- vim.opt.cmdheight = 1
vim.opt.title = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autoread = true
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
vim.opt.exrc = true
