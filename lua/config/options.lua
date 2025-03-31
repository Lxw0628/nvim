-- LazyVim auto format
vim.g.autoformat = false

local opt = vim.opt
opt.scrolloff = 0 -- Lines of context
opt.title = true
opt.jumpoptions = "stack"

-- wrap换行自动对齐上一行
opt.breakindent = true

-- 默认禁用codeium
vim.g.codeium_enabled = false
-- 手动触发
vim.g.codeium_manual = false
-- 自动文本呈现
vim.g.codeium_render = true
-- vim.opt.foldmethod = "manual"
-- 禁用所有动画
vim.g.snacks_animate = false

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
-- vim.g.lazyvim_blink_main = true

-- markdown-preview.nvim configurations
-- https://github.com/iamcco/markdown-preview.nvim?tab=readme-ov-file#markdownpreview-config
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_browser = "wyeb"
vim.g.mkdp_port = "8079"
vim.g.mkdp_theme = "dark"
