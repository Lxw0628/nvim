-- if true then return {} end

local function list_index(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end
    return nil
end

return {
    { -- mapping
        "hrsh7th/nvim-cmp",
        enevt = { "InsertEnter", "CmdlineEnter" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            -- local has_words_before = function()
            --   unpack = unpack or table.unpack
            --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            -- end
            local cmp = require("cmp")
            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<C-b>"] = cmp.mapping.scroll_docs(-1),
                ["<C-f>"] = cmp.mapping.scroll_docs(1),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.config.disable,
                ["<C-y>"] = cmp.config.disable,
                ["<S-CR>"] = cmp.config.disable,
                ["<C-CR>"] = cmp.config.disable,
                ["<Tab>"] = cmp.mapping(function(fallback)
                    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        end
                        cmp.confirm()
                    else
                        fallback()
                    end
                end, { "i", "s", "c" }),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "hrsh7th/cmp-calc", lazy = true },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, { name = "calc" })
        end,
    },
    {
        "hrsh7th/cmp-cmdline",
        keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
        dependencies = { "hrsh7th/nvim-cmp" },
        opts = function()
            local cmp = require("cmp")
            return {
                {
                    type = "/",
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = "buffer" },
                    },
                },
                {
                    type = ":",
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = "path" },
                    }, {
                        {
                            name = "cmdline",
                            option = {
                                ignore_cmds = { "Man", "!" },
                            },
                        },
                    }),
                },
            }
        end,
        config = function(_, opts)
            local cmp = require("cmp")
            vim.tbl_map(function(val)
                cmp.setup.cmdline(val.type, val)
            end, opts)
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function(_, opts)
            if not opts.sources then
                opts.sources = {}
            end
            table.insert(opts.sources, { name = "emoji" })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "hrsh7th/cmp-latex-symbols" },
        opts = function(_, opts)
            if not opts.sources then
                opts.sources = {}
            end
            table.insert(opts.sources, { name = "latex_symbols" })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "chrisgrieser/cmp-nerdfont" },
        opts = function(_, opts)
            if not opts.sources then
                opts.sources = {}
            end
            table.insert(opts.sources, { name = "nerdfont" })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "hrsh7th/cmp-nvim-lua", lazy = true },
        opts = function(_, opts)
            if not opts.sources then
                opts.sources = {}
            end
            table.insert(opts.sources, { name = "nvim_lua" })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "f3fora/cmp-spell", lazy = true },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, { name = "spell" })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "lukas-reineke/cmp-under-comparator", lazy = true },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sorting = opts.sorting or {}
            -- If comparators is not set, use the default. get_config() has defaults now.
            opts.sorting.comparators = opts.sorting.comparators or cmp.get_config().sorting.comparators
            -- Find element in comparators we will position ourselves after.
            -- Position after recently_used, fallback to after score, fallback to 4th position.
            -- recently_used was not in nvim-cmp some time ago.
            local pos = list_index(opts.sorting.comparators, cmp.config.compare.recently_used)
            if pos == nil then
                pos = list_index(opts.sorting.comparators, cmp.config.compare.score)
            end
            if pos == nil then
                pos = 3
            end
            table.insert(opts.sorting.comparators, pos + 1, require("cmp-under-comparator").under)
        end,
    },
    {
        -- TODO:
        -- 提高snippet的优先级
        "nvim-cmp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
            opts.snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            }
            table.insert(opts.sources, { name = "luasnip" })
        end,
    },
    {
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
        "hrsh7th/nvim-cmp",
        optional = true,
        opts = function()
            -- popup windows highlight settings
            -- gray
            vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
            -- blue
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
            -- light blue
            vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
            vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
            vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
            -- pink
            vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
            vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
            -- front
            vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
            vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
            vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
        end,
    },
}
