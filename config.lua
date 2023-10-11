-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- TODO: opts ==================================================
-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
-- 行号 <leader>ul 切换显示
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 命令行数
-- vim.opt.cmdheight = 1
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
vim.opt.exrc = true
-- vim.opt.whichwrap = {}
-- 自动将编辑文件目录设为工作目录
vim.opt.autochdir = true

-- TODO: keymaps ==================================================
-- === 键盘映射 ===
--
-- 插入模式快捷esc
lvim.keys.insert_mode["jk"] = "<ESC>"
-- 删除<Space>w 保存，修改为<C-s>
lvim.builtin.which_key.mappings["w"] = {}
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
lvim.builtin.which_key.mappings["u"] = {
    name = "UI相关",
    l = { function()
        if vim.opt.number:get() or vim.opt.relativenumber:get() then
            vim.opt.number = false
            vim.opt.relativenumber = false
        else
            vim.opt.number = true
            vim.opt.relativenumber = true
        end
    end, "切换显示行数" },
    h = { function()
        if vim.lsp.inlay_hint then
            vim.keymap.set("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "切换显示参数类型" })
        end
    end, "切换显示参数类型" },
    i = { function()
        if vim.fn.has("nvim-0.9.0") == 1 then
            vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "高亮光标下" })
        end
    end, "高亮光标下" },
    n = { function()
        require("notify").dismiss({ silent = true, pending = true })
    end, "清除所有通知"
    },
    d = { function()
        if vim.diagnostic.is_disabled() then
            vim.diagnostic.enable()
            -- print("诊断已启动！")
        else
            vim.diagnostic.disable()
            -- print("诊断已关闭！")
        end
    end, "切换开关诊断"
    },
    f = { function()
        if lvim.format_on_save.enabled then
            lvim.format_on_save.enabled = false
            -- print("自动格式化已关闭!")
        else
            lvim.format_on_save.enabled = true
            -- print("自动格式化已启动!")
        end
    end, "切换保存格式化"
    },
    p = { function()
        require("peepsight").toggle()
    end, "切换专注函数"
    },
}
-- 切换wrap
lvim.keys.normal_mode["<M-z>"] = function()
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
        -- print("自动换行已关闭!")
    else
        vim.opt.wrap = true
        -- print("自动换行已开启!")
    end
end
-- 折叠
-- vim.keymap.set("n", "--", "zf")
-- TypeWriter mode
local typewriter_enable = false
vim.keymap.set("n", "<M-c>", "zz<Cmd>call v:lua.Toggle_typewriter()<CR>", { noremap = true, nowait = true })
function _G.Toggle_typewriter()
    typewriter_enable = not typewriter_enable
    if typewriter_enable then
        vim.keymap.set("n", "j", "gjzz", { silent = true })
        vim.keymap.set("n", "k", "gkzz", { silent = true })
        vim.keymap.set("i", "<CR>", "<CR><Esc>zzi", { noremap = true })
        -- print("TypeWriter is enable!")
    else
        vim.keymap.set("n", "j", "gj", { silent = true })
        vim.keymap.set("n", "k", "gk", { silent = true })
        vim.keymap.set("i", "<CR>", "<CR>", { noremap = true })
        -- print("TypeWriter is disable!")
    end
end

-- 为了解决eslint超时，延迟超时时长
lvim.builtin.which_key.mappings["l"]["f"] = {
    function()
        require("lvim.lsp.utils").format { timeout_ms = 2000 }
    end,
    "Format",
}

-- TODO: autocmd ==================================================
-- 折叠保存
vim.api.nvim_command([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])
lvim.keys.normal_mode["-"] = "zf"
lvim.autocommands = {
    {
        { "ColorScheme" },
        {
            pattern = "*",
            callback = function()
                vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#292e42", bold = true })
                vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#292e42", bold = true })
                -- vim.api.nvim_set_hl(0, "Folded", { bg = "#8470FF", bold = true })
            end,
        },
    },
    {
        { "BufRead" },
        {
            pattern = "*",
            callback = function()
                vim.opt.number = true
                vim.opt.relativenumber = true
                vim.opt.cmdheight = 0
            end
        },
    },
    {
        { "CmdlineEnter" },
        {
            pattern = "*",
            callback = function()
                vim.opt.cmdheight = 1
            end
        },
    },
    {
        { "CmdlineLeave" },
        {
            pattern = "*",
            callback = function()
                vim.opt.cmdheight = 0
            end
        },
    },
}

-- TODO: 修改plugins ==================================================
-- 插件开关
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

-- TODO: 安装plugins ==================================================
-- plugins
-- 安装
lvim.plugins = {
    -- autoclose and autorename html tag
    {
        "windwp/nvim-ts-autotag",
        -- enabled = false,
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    -- Show current function at the top of the screen when function does not fit in screen
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require("treesitter-context").setup({
                enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 1,   -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        "class",
                        "function",
                        "method",
                    },
                },
            })
        end,
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
        config = function()
            require("lsp_signature").on_attach()
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        config = function()
            require("symbols-outline").setup()
        end,
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
        ft = { "markdown" },
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
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "tpope/vim-repeat",
        enabled = false,
    },
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
            require("mini.cursorword").setup()
            require("mini.misc").setup()
            require("mini.move").setup()
            require("mini.surround").setup()
        end,
    },
    {
        "aurum77/live-server.nvim",
        build = function()
            require "live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop", "LiveServerInstall" },
        config = function()
            local status_ok, live_server = pcall(require, "live_server")
            if not status_ok then
                return
            end
            live_server.setup({
                port = 5600,
                browser_command = "microsoft-edge-stable", -- Command or executable path
                quiet = false,
                no_css_inject = true,
                install_path = vim.fn.stdpath "config" .. "/live-server/",
            })
        end
    },
    {
        "folke/noice.nvim",
        enabled = false,
        opts = {
            event = "VeryLazy",
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    progress = {
                        enabled = false,
                    },
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    hover = {
                        enabled = false,
                    },
                    signature = {
                        enabled = false,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end
    },
    -- {
    --     "norcalli/nvim-colorizer.lua",
    --     enabled = false,
    --     config = function()
    --         -- require("colorizer").setup({ "css", "scss", "html", "javascript", "vue" }, {
    --         require("colorizer").setup({ "*" }, {
    --             RGB = true,      -- #RGB hex codes
    --             RRGGBB = true,   -- #RRGGBB hex codes
    --             RRGGBBAA = true, -- #RRGGBBAA hex codes
    --             rgb_fn = true,   -- CSS rgb() and rgba() functions
    --             hsl_fn = true,   -- CSS hsl() and hsla() functions
    --             css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    --             css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
    --         })
    --     end,
    -- },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup {
                filetypes = { "*" },
                user_default_options = {
                    RGB = true,          -- #RGB hex codes
                    RRGGBB = true,       -- #RRGGBB hex codes
                    names = true,        -- "Name" codes like Blue or blue
                    RRGGBBAA = false,    -- #RRGGBBAA hex codes
                    AARRGGBB = false,    -- 0xAARRGGBB hex codes
                    rgb_fn = false,      -- CSS rgb() and rgba() functions
                    hsl_fn = false,      -- CSS hsl() and hsla() functions
                    css = false,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available modes for `mode`: foreground, background,  virtualtext
                    mode = "background", -- Set the display mode.
                    -- Available methods are false / true / "normal" / "lsp" / "both"
                    -- True is same as normal
                    tailwind = false,                                -- Enable tailwind colors
                    -- parsers can contain values used in |user_default_options|
                    sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                    virtualtext = "■",
                    -- update color values even if buffer is not focused
                    -- example use: cmp_menu, cmp_docs
                    always_update = false
                },
                -- all the sub-options of filetypes apply to buftypes
                buftypes = {}, }
        end
    },
    {
        "voldikss/vim-translator",
        config = function()
            vim.keymap.set("n", "m", "<Plug>TranslateW")
            vim.keymap.set("v", "m", "<Plug>TranslateWV")
        end
    },
    {
        "koenverburg/peepsight.nvim",
        config = function()
            require('peepsight').setup({
                -- go
                "function_declaration",
                "method_declaration",
                "func_literal",
                -- typescript
                "class_declaration",
                "method_definition",
                "arrow_function",
                "function_declaration",
                "generator_function_declaration"
            })
        end
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup({
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                            { text = { "%s" },                  click = "v:lua.ScSa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                        },
                    })
                end,
            },
        },
        event = "BufReadPost",
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },
        config = function(_, opts)
            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            -- vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
            local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
            for _, ls in ipairs(language_servers) do
                require('lspconfig')[ls].setup({
                    capabilities = capabilities
                    -- you can add other fields for setting up lsp server in this table
                })
            end
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local totalLines = vim.api.nvim_buf_line_count(0)
                local foldedLines = endLnum - lnum
                local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                local rAlignAppndx =
                    math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
                suffix = (" "):rep(rAlignAppndx) .. suffix
                table.insert(newVirtText, { suffix, "MoreMsg" })
                return newVirtText
            end
            opts["fold_virt_text_handler"] = handler
            require("ufo").setup(opts)
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
            vim.keymap.set("n", "K", function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                    -- vim.cmd [[ Lspsaga hover_doc ]]
                end
            end)
        end,
    },
}

-- TODO: lspSettings ==================================================
--
-- 为 markdown 增加 marksman lsp
require("lvim.lsp.manager").setup("marksman")
-- 增加 emmet lsp
require("lspconfig")["emmet_language_server"].setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
        "typescriptreact", "vue" },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
})
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    {
        command = "prettier",
        -- args = { "--print-width", "100", "--tab-width", "4" },
        args = { "--print-width", "100" },
        -- filetypes = { "html", "css", "javascript", "json", "markdown", "scss" },
    },
    {
        command = "prettier",
        args = { "--print-width", "100", "--tab-width", "4" },
        filetypes = { "javascript" },
    },
    {
        command = "beautysh",
        filetypes = { "sh" },
    },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
})
