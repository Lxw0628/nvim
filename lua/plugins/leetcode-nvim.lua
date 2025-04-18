local leet_arg = "leetcode.nvim"

return {
    {
        "kawre/leetcode.nvim",
        lazy = leet_arg ~= vim.fn.argv(0, -1),
        cmd = "Leet",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/plenary.nvim" }, -- required by telescope
            { "MunifTanjim/nui.nvim" },

            -- optional
            { "rcarriga/nvim-notify", optional = true },
            { "nvim-tree/nvim-web-devicons", optional = true },
            { "nvim-treesitter/nvim-treesitter", optional = true },
        },
        opts = {
            lang = "javascript",
            cn = {
                enabled = true,
            },
            ---@type fun()[]
            hooks = {
                ["question_enter"] = {
                    function()
                        local prefix = "<leader>L"
                        vim.keymap.set("n", prefix, "", { desc = "LeetCode" })
                        vim.keymap.set("n", prefix .. "q", "<Cmd>Leet exit<CR>", { desc = "quit 关闭leetcode.nvim" })
                        vim.keymap.set("n", prefix .. "c", "<Cmd>Leet console<CR>", { desc = "console 打开控制台弹出窗口" })
                        vim.keymap.set("n", prefix .. "i", "<Cmd>Leet info<CR>", { desc = "info 打开问题信息弹出窗口" })
                        vim.keymap.set("n", prefix .. "t", "<Cmd>Leet tabs<CR>", { desc = "tabs 当前已打开问题弹出窗口" })
                        vim.keymap.set("n", prefix .. "y", "<Cmd>Leet yank<CR>", { desc = "yank 复制代码" })
                        vim.keymap.set("n", prefix .. "l", "<Cmd>Leet lang<CR>", { desc = "lang 更改语言" })
                        vim.keymap.set("n", prefix .. "r", "<Cmd>Leet run<CR>", { desc = "run 运行" })
                        vim.keymap.set("n", prefix .. "s", "<Cmd>Leet submit<CR>", { desc = "submit 提交" })
                        vim.keymap.set("n", prefix .. "R", "<Cmd>Leet random<CR>", { desc = "random 打开随机问题" })
                        vim.keymap.set("n", prefix .. "d", "<Cmd>Leet daily<CR>", { desc = "daily 打开每日问题" })
                        vim.keymap.set("n", prefix .. "l", "<Cmd>Leet list<CR>", { desc = "list 打开每日问题" })
                        vim.keymap.set("n", prefix .. "o", "<Cmd>Leet open<CR>", { desc = "open 在默认浏览器中打开此问题" })
                        vim.keymap.set("n", prefix .. "u", "<Cmd>Leet reset<CR>", { desc = "reset 重置为默认代码" })
                    end,
                },
            },
        },
    },
    {
        "folke/snacks.nvim",
        optional = true,
        opts = function(_, opts)
            table.insert(opts.dashboard.preset.keys, 1, {
                action = function()
                    vim.api.nvim_input("<Cmd>Leet<CR>")
                end,
                desc = "LeetCode",
                icon = "",
                key = "e",
            })
        end,
    },
}
