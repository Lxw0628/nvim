-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- lvim.transparent_window = true

-- === opt ===
-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
-- 行号
vim.opt.number = true
vim.opt.relativenumber = true
-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 命令行数
vim.opt.cmdheight = 1

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
vim.opt.exrc = true

-- === 键盘映射 ===
-- 插入模式快捷esc
lvim.keys.insert_mode["jk"] = "<ESC>"

-- 删除<Space>w 保存，修改为<C-s>
lvim.builtin.which_key.mappings['w'] = {}
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<CR>"

-- 删除<Space>c 关闭buffer，修改为<C-w>
lvim.builtin.which_key.mappings["c"] = {}
lvim.keys.normal_mode["<C-w>"] = "<cmd>bd<CR>"

-- 快速移动
lvim.keys.normal_mode["<C-M-h>"] = "0"
lvim.keys.normal_mode["<C-M-j>"] = "5j"
lvim.keys.normal_mode["<C-M-k>"] = "5k"
lvim.keys.normal_mode["<C-M-l>"] = "$"

-- 快速移动
lvim.keys.insert_mode["<C-M-h>"] = "<HOME>"
lvim.keys.insert_mode["<C-M-j>"] = "<DOWN><DOWN><DOWN><DOWN><DOWN>"
lvim.keys.insert_mode["<C-M-k>"] = "<UP><UP><UP><UP><UP>"
lvim.keys.insert_mode["<C-M-l>"] = "<END>"

-- 快速移动
lvim.keys.visual_mode["<C-M-h>"] = "0"
lvim.keys.visual_mode["<C-M-j>"] = "5j"
lvim.keys.visual_mode["<C-M-k>"] = "5k"
lvim.keys.visual_mode["<C-M-l>"] = "$"

-- 插入模式下移动光标
lvim.keys.insert_mode["<C-h>"] = "<LEFT>"
lvim.keys.insert_mode["<C-j>"] = "<DOWN>"
lvim.keys.insert_mode["<C-k>"] = "<UP>"
lvim.keys.insert_mode["<C-l>"] = "<RIGHT>"

-- 切换buffer
lvim.keys.normal_mode["H"] = "<cmd>bprevious<CR>"
lvim.keys.normal_mode["L"] = "<cmd>bnext<CR>"

-- 分割窗口
lvim.builtin.which_key.mappings["w"] = {
    name = "分割窗口",
    h = { "<C-w>v", "水平分割窗口" },
    v = { "<C-w>s", "垂直分割窗口" },
    c = { "<C-w>c", "关闭选中分割窗口" },
}

-- 切换wrap
-- lvim.keys.normal_mode["<M-z>"] = "&wrap == 1 ? ':set nowrap<cr>' : ':set wrap<cr>'"
lvim.keys.normal_mode["<M-z>"] = function()
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
        print("自动换行已关闭！")
    else
        vim.opt.wrap = true
        print("自动换行已开启！")
    end
end

-- === Plugins ===
-- 关闭插件
-- lvim.builtin.comment.active = false
-- 配置
-- trouble
lvim.builtin.which_key.mappings["t"] = {
    name = "诊断",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- autocmd

-- command
-- 折叠保存
vim.api.nvim_command([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])
lvim.keys.normal_mode["-"] = "zf"

-- 安装
lvim.plugins = {
    -- autoclose and autorename html tag
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    -- Show current function at the top of the screen when function does not fit in screen
    {
        "romgrk/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require("treesitter-context").setup {
                enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },
    -- ranger file explorer window
    {
        "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        config = function()
            vim.g.rnvimr_draw_border = 1
            vim.g.rnvimr_pick_enable = 1
            vim.g.rnvimr_bw_enable = 1
        end,
    },
    {
        "terryma/vim-expand-region",
        keys = {
            { "v", "<Plug>(expand_region_expand)", { silent = true }, mode = { "v" } },
            { "V", "<Plug>(expand_region_shrink)", { silent = true }, mode = { "v" } },
        },
        config = function()
            vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { silent = true })
            vim.keymap.set("v", "V", "<Plug>(expand_region_shrink)", { silent = true })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    {
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        config = function()
            require('symbols-outline').setup()
        end
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    -- You must install glow globally
    -- https://github.com/charmbracelet/glow
    -- yay -S glow
    {
        "npxbr/glow.nvim",
        event = "VeryLazy",
        ft = { "markdown" }
        -- build = "yay -S glow"
    },
    {
        "iamcco/markdown-preview.nvim",
        event = "VeryLazy",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_browser = "wyeb"
            vim.g.mkdp_markdown_css = "~/.config/nvim/colors/markdown.css"
            vim.g.mkdp_page_title = "${name}"
            vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
            vim.g.mkdp_theme = "dark"
            vim.g.vmt_fence_text = "markdown-toc"
            vim.keymap.set("n", "<F5>", "<Plug>MarkdownPreviewToggle")
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
            })
        end
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    { "tpope/vim-repeat" },
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        config = function()
            require("mini.ai").setup()
            require("mini.align").setup()
            require("mini.basics").setup({
                mappings = {
                    -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
                    -- Supply empty string to not create these mappings.
                    option_toggle_prefix = "",
                    -- Window navigation with <C-hjkl>, resize with <C-arrow>
                    windows = true,
                },
            })
            require("mini.bufremove").setup()
            require("mini.comment").setup({
                mappings = {
                    comment = "<leader>/",
                    comment_line = "<leader>/",
                    textobject = "",
                },
            })
            require("mini.cursorword").setup()
            require("mini.jump").setup({
                mappings = {
                    repeat_jump = "",
                },
            })
            require("mini.surround").setup()
        end,
    },
    {
        "turbio/bracey.vim",
        event = "VeryLazy",
        cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
        build = "npm install --prefix server",
    },
}

-- lspSettings
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    {
        command = "prettier",
        args = { "--print-width", "100", "--tab-width", "4" },
        filetypes = { "html", "css", "javascript", "json", "markdown", "scss" },
    },
    {
        command = "beautysh",
        filetypes = { "sh" },
    },
})
