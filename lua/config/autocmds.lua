-- 折叠保存
vim.api.nvim_command([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])
