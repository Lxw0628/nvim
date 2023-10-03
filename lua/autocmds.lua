-- 折叠保存
vim.api.nvim_command([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])
vim.api.nvim_create_autocmd(
    { "BufEnter", "CmdlineLeave" },
    {
        pattern = "*",
        callback = function()
            vim.opt.cmdheight = 0
        end
    }
)
vim.api.nvim_create_autocmd(
    { "CmdlineEnter" },
    {
        pattern = "*",
        callback = function()
            vim.opt.cmdheight = 1
        end
    }
)
