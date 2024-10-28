-- if true then return {} end

return {
    {
        "Exafunction/codeium.vim",

        init = function()
            vim.g.codeium_filetypes = {
                TelescopePrompt = false,
                ["neo-tree-popup"] = false,
                ["dap-repl"] = false,
            }
        end,
        config = function()
            -- 禁用默认键绑定
            vim.g.codeium_disable_bindings = 1

            vim.keymap.set("i", "<Tab>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true, silent = true })
            -- vim.keymap.set("i", "<c-;>", function()
            --     return vim.fn["codeium#CycleCompletions"](1)
            -- end, { expr = true, silent = true })
            -- vim.keymap.set("i", "<c-,>", function()
            --     return vim.fn["codeium#CycleCompletions"](-1)
            -- end, { expr = true, silent = true })
            vim.keymap.set("i", "<C-x>", function()
                return vim.fn["codeium#Clear"]()
            end, { expr = true, silent = true })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "Exafunction/codeium.vim" },
            { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                },
            },
            { "hrsh7th/cmp-calc" },
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local types = require("cmp.types")

            -- Function to sort LSP snippets, so that they appear at the end of LSP suggestions
            local function deprioritize_snippet(entry1, entry2)
                if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
                    return false
                end
                if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
                    return true
                end
            end

            -- Insert `deprioritize_snippet` first in the `comparators` table, so that it has priority
            -- over the other default comparators
            table.insert(opts.sorting.comparators, 1, deprioritize_snippet)

            -- Insert parentheses after selecting method/function
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            -- Make codeium suggestions appear only when `nvim-cmp` menu is closed
            cmp.event:on("menu_opened", function()
                vim.g.codeium_manual = true
                vim.fn["codeium#Clear"]()
            end)
            cmp.event:on("menu_closed", function()
                vim.g.codeium_manual = false
                vim.fn["codeium#Complete"]()
            end)
        end,
    },
}
