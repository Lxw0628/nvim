-- LazyVim auto format
vim.g.autoformat = false

local opt = vim.opt
opt.scrolloff = 0 -- Lines of context

-- 默认禁用codeium
vim.g.codeium_enabled = false
-- 手动触发
vim.g.codeium_manual = false
-- 自动文本呈现
vim.g.codeium_render = true
-- vim.opt.foldmethod = "manual"
