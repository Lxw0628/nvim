vim.g.mapleader = " "

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

-- 快速移动
keymap.set("i", "<C-M-j>", "<DOWN><DOWN><DOWN><DOWN><DOWN>")
keymap.set("i", "<C-M-k>", "<UP><UP><UP><UP><UP>")
keymap.set("i", "<C-M-h>", "<HOME>")
keymap.set("i", "<C-M-l>", "<END>")

-- ---------- 视觉模式 ---------- ---

-- 快速移动
keymap.set("v", "<C-M-j>", "5j")
keymap.set("v", "<C-M-k>", "5k")
keymap.set("v", "<C-M-h>", "0")
keymap.set("v", "<C-M-l>", "$")

-- ---------- 正常模式 ---------- ---
-- 保存关闭
-- keymap.set("n", "<leader>w", "<ESC>:w<CR>")
keymap.set("n", "<C-s>", ":w<cr>", { noremap = true, silent = true })
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

-- 切换Wrap Alt+z
keymap.set(
	"n",
	"<M-z>",
	"&wrap == 1 ? ':set nowrap<cr>' : ':set wrap<cr>'",
	{ noremap = true, expr = true}
)

