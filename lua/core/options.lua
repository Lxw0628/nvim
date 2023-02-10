local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 当光标到达屏幕边缘时，将自动扩展显示1/2屏幕的文本
opt.sidescroll = 0

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
vim.cmd[[colorscheme tokyonight-moon]]

-- 重新打开缓冲区恢复光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd("silent! foldopen")
        end
    end,
})

-- 折叠保存
vim.api.nvim_command([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview 
]])

-- 折叠
-- vim.opt.foldenable = true
-- vim.opt.foldcolumn = '1'
-- vim.opt.foldmethod = 'manual'
-- vim.opt.viewdir = os.getenv('HOME') .. '/.config/nvim/cache/viewdir'
-- vim.opt.foldtext = 'v:lua.MagicFoldText()'
-- function MagicFoldText()
--     local spacetext = ("        "):sub(0, vim.opt.shiftwidth:get())
--     local line = vim.fn.getline(vim.v.foldstart):gsub("\t", spacetext)
--     local folded = vim.v.foldend - vim.v.foldstart + 1
--     local findresult = line:find('%S')
--     if not findresult then return '+ folded ' .. folded .. ' lines ' end
--     local empty = findresult - 1
--     local funcs = {
--         [0] = function(_) return '' .. line end,
--         [1] = function(_) return '+' .. line:sub(2) end,
--         [2] = function(_) return '+ ' .. line:sub(3) end,
--         [-1] = function(c)
--             local result = ' ' .. line:sub(c + 1)
--             local foldednumlen = #tostring(folded)
--             for _ = 1, c - 2 - foldednumlen do result = '-' .. result end
--             return '+' .. folded .. result
--         end,
--     }
--     return funcs[empty <= 2 and empty or -1](empty) .. ' folded ' .. folded .. ' lines '
-- end
