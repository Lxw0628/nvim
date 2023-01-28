local keyset = vim.keymap.set

vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_use_smartsign_us = 1

-- 更换‘;’为启动键
keyset("n", ";", "<Plug>(easymotion-prefix)")

