return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    init = function()
        vim.keymap.set("n", "<Leader>uZ", "<Cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
    end,
    opts = {
        window = {
            backdrop = 1,
            width = function()
                return math.min(120, vim.o.columns * 0.75)
            end,
            height = 0.9,
            options = {
                number = true,
                relativenumber = true,
                foldcolumn = "0",
                list = false,
                showbreak = "NONE",
                signcolumn = "no",
            },
        },
        plugins = {
            options = {
                cmdheight = 0,
                laststatus = 0,
            },
        },
        on_open = function() -- disable diagnostics, indent blankline, winbar, and offscreen matchup
        end,
        on_close = function() -- restore diagnostics, indent blankline, winbar, and offscreen matchup
        end,
    },
}
