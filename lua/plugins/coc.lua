vim.g.coc_global_extensions = {
    'coc-tsserver',
    'coc-translator',
    'coc-stylelintplus',
    'coc-snippets',
    'coc-sh',
    'coc-pairs',
    'coc-marketplace',
    'coc-lua',
    'coc-json',
    'coc-lists',
    'coc-java',
    'coc-html-css-support',
    'coc-html',
    'coc-highlight',
    'coc-git',
    'coc-emmet',
    'coc-cmake',
    'coc-actions',
    'coc-clangd',
    'coc-word',
    'coc-jedi',
    'coc-actions',
}

---@diagnostic disable: redefined-local, undefined-global
-- 一些服务器有备份文件的问题，参见#649
vim.opt.backup = false
vim.opt.writebackup = false
-- vim.opt.backup = true
-- vim.opt.writebackup = true

-- 拥有更长的更新时间（默认为 4000 ms = 4s）导致明显
-- 延迟和糟糕的用户体验
vim.opt.updatetime = 100

-- 始终显示符号栏，否则每次diagnostics出现/解决时它都会移动文本
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- 使用 Tab 触发前面字符的补全和导航
-- 注意：总是有一个默认选择的完成项，你可能想要启用
-- 通过在你的配置文件中设置 `"suggest.noselect": true` 不选择
-- 注意：使用命令 ':verbose imap <tab>' 确保 Tab 未被映射
-- 在将其放入您的配置之前的其他插件
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
--
-- 使<CR>接受选择的补全项或通知coc.nvim格式化
-- <C-g>u 中断当前撤销，请自行选择
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- 使用 gj 触发片段
keyset("i", "<M-p>", "<Plug>(coc-snippets-expand-jump)", {silent = true})
--- 使用 <c-space> 触发完成
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- 使用 `[g` 和 `]g` 导航诊断
-- 使用 `:CocDiagnostics` 获取位置列表中当前缓冲区的所有诊断信息
keyset("n", "<leader>-", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "<leader>=", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo代码导航
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true}) -- 定义
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true}) -- 类型定义
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true}) -- 实现
keyset("n", "gr", "<Plug>(coc-references)", {silent = true}) -- 引用


-- 使用 K 在预览窗口中显示文档
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
        -- vim.fn.CocActionAsync('definitionHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- keyset("n", "<leader>k", ":call CocAction('definitionHover')<CR>", {silent = true})

-- 在 CursorHold 事件中高亮符号及其引用（光标空闲）
-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- 符号重命名
-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- 格式化选择的代码
-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })


-- 设置 formatexpr 指定的文件类型
-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- 更新跳转占位符上的签名帮助
-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- 将 codeAction 应用于所选区域
-- 示例：当前段落的 `<leader>aap`
-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- 重新映射键以在光标位置应用代码操作。
-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- 应用代码操作的重新映射键影响整个缓冲区。
-- Remap keys for apply code actions affect whole buffer.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- 将 codeActions 应用到当前缓冲区的重新映射键
-- Remap keys for applying codeActions to the current buffer
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
-- 在当前行应用最喜欢的快速修复操作。
-- Apply the most preferred quickfix action on the current line.
-- keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- 重新映射键以应用重构代码操作。
-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- 在当前行运行 Code Lens 操作
-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- 映射函数和类文本对象
-- 注意：需要语言服务器的“textDocument.documentSymbol”支持
-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- 重新映射 <C-f> 和 <C-b> 以滚动浮动窗口/弹出窗口
---@diagnostic disable-next-line: redefined-local
-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
-- local opts = {silent = true, nowait = true, expr = true}
-- keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
-- keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
-- keyset("i", "<C-f>",
       -- 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
-- keyset("i", "<C-b>",
       -- 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
-- keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
-- keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- 使用 CTRL-S 选择范围
-- 需要语言服务器的 'textDocument/selectionRange' 支持
-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
-- keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
-- keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- 添加 `:Format` 命令来格式化当前缓冲区
-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " 添加 `:Fold` 命令来折叠当前缓冲区
-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- 添加 `:OR` 命令来组织当前缓冲区的导入
-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- 添加 (Neo)Vim 的原生状态行支持
-- 注意：请参阅 `:h coc-status` 与外部插件的集成
-- 提供自定义状态栏：lightline.vim, vim-airline
-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
keyset("n", "<C-e>", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
-- keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
-- keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
-- keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
-- keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
-- keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

-- === coc-translator ===
keyset("n", "m", "<Plug>(coc-translator-p)", opts)
keyset("v", "m", "<Plug>(coc-translator-pv)", opts)

