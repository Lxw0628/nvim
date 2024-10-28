if true then return {} end

return {
    "Exafunction/codeium.nvim",
    config = function()
        require("codeium").setup({
            enable_chat = true,
            enable_cmp_source = false,
            virtual_text = {
                enabled = true,
                -- These are the defaults
                -- Set to true if you never want completions to be shown automatically.
                manual = false,
                -- A mapping of filetype to true or false, to enable virtual text.
                filetypes = {},
                -- Whether to enable virtual text of not for filetypes not specifically listed above.
                default_filetype_enabled = true, -- How long to wait (in ms) before requesting completions after typing stops.
                idle_delay = 75,
                -- Priority of the virtual text. This usually ensures that the completions appear on top of
                -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
                -- desired.
                virtual_text_priority = 65535,
                -- Set to false to disable all key bindings for managing completions.
                map_keys = true,
                -- The key to press when hitting the accept keybinding but no completion is showing.
                -- Defaults to \t normally or <c-n> when a popup is showing.
                accept_fallback = nil,
                -- Key bindings for managing completions in virtual text mode.
                key_bindings = {
                    -- Accept the current completion.
                    accept = "<Tab>",
                    -- Accept the next word.
                    accept_word = false,
                    -- Accept the next line.
                    accept_line = false,
                    -- Clear the virtual text.
                    clear = "<C-e>",
                    -- Cycle to the next completion.
                    next = "<M-]>",
                    -- Cycle to the previous completion.
                    prev = "<M-[>",
                },
            },
        })

        local function is_codeium_enabled()
            local enabled = vim.b["codeium_enabled"]
            if enabled == nil then
                enabled = vim.g["codeium_enabled"]
                if enabled == nil then
                    enabled = true -- enable by default
                end
            end
            return enabled
        end

        local toggle = require("lazyvim.util.toggle")
        -- vim.api.nvim_set_keymap("n", "<Leader>;", "", { desc = "Codeium" })
        vim.keymap.set("n", "<Leader>;", "", { desc = "Codeium" })
        vim.keymap.set("n", "<Leader>;o", "<Cmd>Codeium Chat", { desc = "Codeium Chat" })
        toggle.map("<Leader>;;", {
            name = "Codeium",
            get = function()
                return is_codeium_enabled()
            end,
            set = function(state)
                if state then
                    vim.b["codeium_enabled"] = true
                else
                    vim.b["codeium_enabled"] = false
                end
            end,
        })

        local Source = require("codeium.source")
        --- save reference to library available function
        local superclass_is_available = Source.is_available
        --- overwrite the library built-in is_available function
        --- so that I can disable when I want to
        ---@diagnostic disable-next-line: duplicate-set-field
        function Source:is_available()
            return is_codeium_enabled() and superclass_is_available(self)
        end

        require("codeium.virtual_text").set_statusbar_refresh(function()
            require("lualine").refresh()
        end)
    end,
}
