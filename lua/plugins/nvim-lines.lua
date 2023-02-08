vim.g.line_statusline_enable = 1          -- 状态栏 是否开启
vim.g.line_tabline_enable = 0             -- 标题栏 是否开启
vim.g.line_powerline_enable = 0           -- 状态栏 标题栏 展示powerline字体
vim.g.line_nerdfont_enable = 0            -- 状态栏 标题栏 展示nerdfont图标
vim.g.line_dclick_interval = 100          -- 标题栏 双击的间隔(双击可用于关闭buffer)
vim.g.line_modi_mark = '+'                -- 标题栏 发生变更的buffer的标记
vim.g.line_unnamed_filename = '[unnamed]' -- 状态栏 标题栏 未命名文件 文件名
vim.g.line_statusline_getters = { }        -- 状态栏 额外展示的内容的获取方法名 以下有部分使用例子
-- vim.g.line_mode_map = {"n": "NORMAL", "v": "VISUAL", "V": "V-LINE", "\<c-v>": "V-CODE", "i": "INSERT", "R": "R", "r": "R", "Rv": "V-REPLACE", "c": "CMD-IN", "s": "SELECT", "S": "SELECT", "\<c-s>": "SELECT", "t": "TERMINAL"}
-- vim.g.line_hl = { 'none': 'NONE', 'light': '24', 'dark': '238', 'break': '244', 'space': '238' } -- 高亮设置
-- 状态栏表示进度的符号组
vim.g.line_percent_bar = { '░░░', '▒░░', '█░░', '█▒░', '██░', '██▒', '███' }
vim.g.line_statusline_headsymbol = '▒'    -- 状态栏左侧头部的符号
vim.g.line_tabline_headsymbol = '▒'       -- 标题栏左侧头部的符号
vim.g.line_powerline_enable = 1
vim.g.line_nerdfont_enable = 1
vim.g.line_unnamed_filename='~'
vim.g.line_statusline_getters = {'v:lua.GitInfo', 'v:lua.CocErrCount', 'v:lua.GetFt'}
-- git status base by coc-git
function GitInfo()
    local branch = vim.g.coc_git_status or ''
    local diff = vim.b.coc_git_status or ''
    return (string.len(branch) > 0 and string.format(" %s ", branch) or " none ")
        .. (string.len(diff) > 0 and string.format('%s ', vim.fn.trim(diff)) or '')
end
-- diagnostic info base by coc
function CocErrCount()
    local coc_diagnostic_info = vim.b.coc_diagnostic_info or { error = 0 }
    return string.format(' E%d ', coc_diagnostic_info.error)
end
-- show ft
function GetFt()
    local ft = vim.api.nvim_eval('&ft')
    return string.format(' %s ', string.len(ft) > 0 and ft or '~')
end


