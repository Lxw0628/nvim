return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    keys = {
        { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = '查找文件' },
        { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = '跨文件模糊搜索内容' },
        { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", desc = '关键字帮助文档' },
        { '<leader><space>', "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<CR>",
            desc = '跳转当前打开的buffers' },
        { '<leader>fo', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", desc = '查找历史文件' },
        {
            '<C-f>',
            function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            desc = '当前buffer内模糊搜索'
        },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                }
            }
        }
        require('telescope').load_extension('fzf')
        -- vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = '查找文件' })
        -- vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = '跨文件模糊搜索内容' })
        -- vim.keymap.set('n', '<leader><space>', "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<CR>", { desc = '跳转当前打开的buffers', silent = true })
        -- vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { desc = '关键字帮助文档' })
        -- vim.keymap.set('n', '<leader>fo', "<cmd>lua require('telescope.builtin').oldfiles<CR>", { desc = '查找历史文件' })
        -- vim.keymap.set('n', '<C-f>', function()
        --     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        --         winblend = 10,
        --         previewer = false,
        --     })
        -- end, { desc = '当前buffer内模糊搜索' })
    end
}
