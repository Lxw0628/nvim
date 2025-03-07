-- if true then return {} end

-- BUG: Failed to run `config` for snacks.nvim
-- ...cal/share/nvim/lazy/snacks.nvim/lua/snacks/dashboard.lua:239: E565: Not allowed to change text or change window
-- # stacktrace:
--   - /snacks.nvim/lua/snacks/dashboard.lua:239 _in_ **init**
--   - /snacks.nvim/lua/snacks/dashboard.lua:227 _in_ **open**
--   - /snacks.nvim/lua/snacks/dashboard.lua:1163 _in_ **setup**
--   - /snacks.nvim/lua/snacks/init.lua:169 _in_ **load**
--   - /snacks.nvim/lua/snacks/init.lua:179 _in_ **setup**
--   - /LazyVim/lua/lazyvim/plugins/init.lua:23 _in_ **config**
--   - :lua:1

return {
    ---@type LazySpec
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = { "folke/snacks.nvim", lazy = true },
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>fy",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                -- Open in the current working directory
                "<leader>fY",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        ---@type YaziConfig | {}
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
        -- 👇 if you use `open_for_directories=true`, this is recommended
        init = function()
            -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
            -- vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
    },
}
