local opt = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
-- 行号
opt.relativenumber = false
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

-- Global Settings --
global.mapleader = " "

-- Key mappings --
local keymap = vim.keymap
local opts = { silent = true }

-- ---------- 插入模式 -------------
keymap.set("i", "jk", "<ESC>")

-- 插入模式下移动光标
keymap.set("i", "<C-h>", "<LEFT>")
keymap.set("i", "<C-j>", "<DOWN>")
keymap.set("i", "<C-k>", "<UP>")
keymap.set("i", "<C-l>", "<RIGHT>")

-- 单行或多行移动
-- keymap.set("i", "<M-j>", "<ESC>:m .+1<CR>i<RIvimHT>")
-- keymap.set("i", "<M-k>", "<ESC>:m .-2<CR>i<RIvimHT>")

-- 快速移动
keymap.set("i", "<C-M-j>", "<DOWN><DOWN><DOWN><DOWN><DOWN>")
keymap.set("i", "<C-M-k>", "<UP><UP><UP><UP><UP>")
keymap.set("i", "<C-M-h>", "<HOME>")
keymap.set("i", "<C-M-l>", "<END>")

-- ---------- 视觉模式 ---------- ---
-- keymap.set("v", "jk", "<ESC>")
keymap.set("v", "<leader>w", ":call v:lua.MagicSave()<CR>", { noremap = true })

-- 单行或多行移动
-- keymap.set("v", "<M-j>", ":m '>+1<cr>gv", { noremap = true, silent = true })
-- keymap.set("v", "<M-k>", ":m '<-2<cr>gv", { noremap = true, silent = true })

-- 快速移动
keymap.set("v", "<C-M-j>", "5j")
keymap.set("v", "<C-M-k>", "5k")
keymap.set("v", "<C-M-h>", "0")
keymap.set("v", "<C-M-l>", "$")

-- 折行移动
-- keymap.set("v", "j", "gj", {silent = true})
-- keymap.set("v", "k", "gk", {silent = true})

-- ---------- 正常模式 ---------- ---
-- 保存关闭
-- keymap.set("n", "<leader>w", "<ESC>:w<CR>")
keymap.set("n", "<C-s>", ":call v:lua.MagicSave()<cr>", { noremap = true, silent = true })
keymap.set("n", "<leader>q", "<ESC>:q!<CR>")

-- 单行或多行移动
keymap.set("n", "<M-j>", ":m .+1<cr>", { noremap = true, silent = true })
keymap.set("n", "<M-k>", ":m .-2<cr>", { noremap = true, silent = true })

-- 折行移动
keymap.set("n", "j", "gj", { silent = true })
keymap.set("n", "k", "gk", { silent = true })

-- 快速移动
keymap.set("n", "<C-M-j>", "5j")
keymap.set("n", "<C-M-k>", "5k")
keymap.set("n", "<C-M-h>", "0")
keymap.set("n", "<C-M-l>", "$")

-- 窗口
keymap.set("n", "<leader>wh", "<C-w>v", { desc = "水平分割窗口" }) -- 水平新增窗口
keymap.set("n", "<leader>wv", "<C-w>s", { desc = "垂直分割窗口" }) -- 垂直新增窗口
keymap.set("n", "<leader>wc", "<C-w>c", { desc = "关闭窗口" }) -- 关闭窗口

keymap.set("n", "<C-w>v", "<Nop>") -- 垂直新增窗口
keymap.set("n", "<C-w>s", "<Nop>") -- 垂直新增窗口

-- 快速滚动居中
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- 全选/选择
keymap.set("n", "<M-a>", "ggVG")
keymap.set("n", "<M-f>", "vif")
keymap.set("n", "<M-]>", "vi]")
keymap.set("n", "<M-[>", "vi[")
keymap.set("n", "<M-(>", "vi(")
keymap.set("n", "<M-)>", "vi)")
keymap.set("n", "<M-'>", "vi'")
keymap.set("n", '<M-">', 'vi"')

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<C-w>", ":bw<CR>", { silent = true, nowait = true })

-- 切换光标居中（打字机模式) =================================================
local typewriter_enable = false
keymap.set("n", "<M-c>", "zz<Cmd>call v:lua.Toggle_typewriter()<CR>", { noremap = true, nowait = true })
function _G.Toggle_typewriter()
	typewriter_enable = not typewriter_enable
	if typewriter_enable then
		keymap.set("n", "j", "gjzz", { silent = true })
		keymap.set("n", "k", "gkzz", { silent = true })
		keymap.set("i", "<CR>", "<CR><Esc>zzi", { noremap = true })
		print("TypeWriter is enable!")
	else
		keymap.set("n", "j", "gj", { silent = true })
		keymap.set("n", "k", "gk", { silent = true })
		keymap.set("i", "<CR>", "<CR>", { noremap = true })
		print("TypeWriter is disable!")
	end
end

-- ===========================================================================

-- 切换Wrap Alt+z
keymap.set(
	"n",
	"<M-z>",
	"&wrap == 1 ? ':set nowrap<cr>' : ':set wrap<cr>'",
	{ noremap = true, expr = true}
)

-- 折叠保存
vim.api.nvim_command([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])

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
	if vim.fn.empty(vim.fn.glob(vim.fn.expand("%:p:h"))) then
		vim.fn.system("mkdir -p " .. vim.fn.expand("%:p:h"))
	end
	if vim.o.buftype == "acwrite" then
		vim.fn.execute("w !sudo tee > /dev/null %")
	else
		vim.fn.execute("w")
	end
end

-- vim.cmd([[
-- let fcitx5state=system("fcitx5-remote")
-- " 2 表示之前状态打开了输入法，则进入插入模式时启动输入法
-- " 退出插入模式时禁用输入法，并保存状态
-- autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
-- autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
-- ]])
