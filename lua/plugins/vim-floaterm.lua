local keyset = vim.keymap.set

vim.g.floaterm_title = ''
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_autoclose = 0
vim.g.floaterm_opener = 'edit'

local opts = {silent = true, nowait = true}
keyset({"n", "t"}, "<M-1>", "<Cmd>:FloatermToggle<CR>", opts)
