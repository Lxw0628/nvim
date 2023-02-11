vim.g.mapleader = " "

local keymap = vim.keymap
local opts = {silent = true}

-- ---------- 插入模式 -------------
keymap.set("i", "jk", "<ESC>")

-- 插入模式下移动光标
keymap.set("i", "<C-h>", "<LEFT>")
keymap.set("i", "<C-j>", "<DOWN>")
keymap.set("i", "<C-k>", "<UP>")
keymap.set("i", "<C-l>", "<RIvimHT>")

-- 单行或多行移动
keymap.set("i", "<M-j>", "<ESC>:m .+1<CR>i<RIvimHT>")
keymap.set("i", "<M-k>", "<ESC>:m .-2<CR>i<RIvimHT>")

-- 快速移动
keymap.set("i", "<C-M-j>", "<DOWN><DOWN><DOWN><DOWN><DOWN>")
keymap.set("i", "<C-M-k>", "<UP><UP><UP><UP><UP>")
keymap.set("i", "<C-M-h>", "<HOME>")
keymap.set("i", "<C-M-l>", "<END>")

-- ---------- 视觉模式 ---------- ---
-- keymap.set("v", "jk", "<ESC>")
keymap.set("v", "<leader>w", ":call v:lua.MagicSave()<CR>", {noremap = true, silent = true})

-- 单行或多行移动
keymap.set("v", "<M-j>", ":m '>+1<cr>gv", { noremap = true, silent = true })
keymap.set("v", "<M-k>", ":m '<-2<cr>gv", { noremap = true, silent = true })
-- 快速移动
keymap.set("v", "<C-M-j>", "5j")

keymap.set("v", "<C-M-k>", "5k")
keymap.set("v", "<C-M-h>", "0")
keymap.set("v", "<C-M-l>", "$")

-- ---------- 正常模式 ---------- ---
-- 保存关闭
-- keymap.set("n", "<leader>w", "<ESC>:w<CR>")
keymap.set("n", "<leader>w", ":call v:lua.MagicSave()<cr>", {noremap = true, silent = true})
keymap.set("n", "<leader>q", "<ESC>:q!<CR>")

-- 单行或多行移动
keymap.set("n", "<M-j>", ":m .+1<cr>", { noremap = true, silent = true })
keymap.set("n", "<M-k>", ":m .-2<cr>", { noremap = true, silent = true })

-- 折行移动
keymap.set("n", "j", "gj", {silent=true})

-- 快速移动
keymap.set("n", "<C-M-j>", "5j")
keymap.set("n", "k", "gk", {silent=true})
keymap.set("n", "<C-M-k>", "5k")
keymap.set("n", "<C-M-h>", "0")
keymap.set("n", "<C-M-l>", "$")

-- 窗口
keymap.set("n", "<M-w>v", "<C-w>v", {silent = true, nowait = true}) -- 水平新增窗口
keymap.set("n", "<M-w>h", "<C-w>s") -- 垂直新增窗口

-- 快速滚动居中
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- 全选/选择
keymap.set("n", "<M-a>", "ggVvim")
keymap.set("n", "<M-f>", "vif")
keymap.set("n", "<M-]>", "vi]")
keymap.set("n", "<M-(>", "vi(")
keymap.set("n", "<M-)>", "vi)")
keymap.set("n", "<M-'>", "vi'")
keymap.set("n", "<M-[>", "vi[")
keymap.set("n", "<M-\">", "vi\"")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<M-l>", ":bnext<CR>", opts)
keymap.set("n", "<M-h>", ":bprevious<CR>", opts)
keymap.set("n", "<C-w>", ":bw<CR>", opts)

-- 切换Wrap Alt+z
keymap.set("n", "<M-z>", "&wrap == 1 ? ':set nowrap<cr>' : ':set wrap<cr>'", { noremap = true, expr = true, silent = true })

-- ===折叠函数
keymap.set("n", "--", ":call MagicFold()<CR>", { noremap = true, silent = true })
keymap.set("v", "-", "zf", { noremap = true, silent = true })
vim.api.nvim_command([[
    fun! MagicFold()
        if foldclosed(line('.')) != -1
            exe 'norm! za'
            return
        endif
        let l:line = trim(getline('.'))
        if l:line == '' | return | endif
        let [l:up, l:down] = [0, 0]
        if l:line[0] == '}'
            exe 'norm! ^%'
            let l:up = line('.')
            exe 'norm! %'
        endif
        if l:line[len(l:line) - 1] == '{'
            exe 'norm! $%'
            let l:down = line('.')
            exe 'norm! %'
        endif
        try
            if l:up != 0 && l:down != 0
                exe 'norm! ' . l:up . 'vimV' . l:down . 'vimzf'
            elseif l:up != 0
                exe 'norm! V' . l:up . 'vimzf'
            elseif l:down != 0
                exe 'norm! V' . l:down . 'vimzf'
            else
                exe 'norm! za'
            endif
        catch
            redraw!
        endtry
    endf
]])

function MagicSave()
    if vim.fn.empty(vim.fn.glob(vim.fn.expand('%:p:h'))) then vim.fn.system('mkdir -p ' .. vim.fn.expand('%:p:h')) end
    if vim.o.buftype == 'acwrite' then
        vim.fn.execute('w !sudo tee > /dev/null %')
    else
        vim.fn.execute('w')
    end
end

-- ---------- 插件 ---------- ---
-- nvim-tree
local opts = {silent = true, nowait = true}
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- coc-explorer
-- keymap.set("n", "<leader>e", "<Cmd>CocCommand explorer<CR>", opts)
