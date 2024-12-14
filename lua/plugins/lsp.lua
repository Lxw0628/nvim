return {
    -- Fix clangd offset encodings
    {
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "luacheck",
                "shellcheck",
                "shfmt",
                "tailwindcss-language-server",
                -- "typescript-language-server",
                "css-lsp",
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            -- ---@type lspconfig.options
            servers = {
                html = {},
                cssls = {},
                emmet_language_server = {
                    filetypes = {
                        "css",
                        "eruby",
                        "html",
                        -- "javascript",
                        -- "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "pug",
                        -- "typescriptreact",
                    },
                    -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                    -- **Note:** only the options listed in the table are supported.
                    init_options = {
                        ---@type table<string, string>
                        includeLanguages = {},
                        --- @type string[]
                        excludeLanguages = {},
                        --- @type string[]
                        extensionsPath = {},
                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                        preferences = {},
                        --- @type boolean Defaults to `true`
                        showAbbreviationSuggestions = true,
                        --- @type "always" | "never" Defaults to `"always"`
                        showExpandedAbbreviation = "always",
                        --- @type boolean Defaults to `false`
                        showSuggestionsAsSnippets = true,
                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                        syntaxProfiles = {
                            -- html = {
                            --   filters = "bem"
                            -- }
                        },
                        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                        variables = {
                            lang = "zh-CN",
                            locale = "zh-CN",
                            charset = "UTF-8",
                            indentation = "\t",
                            newline = "\n",
                        },
                    },
                },
                tailwindcss = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                },
                lua_ls = {
                    -- enabled = false,
                    single_file_support = true,
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                workspaceWord = true,
                            },
                            misc = {
                                parameters = {
                                    -- "--log-level=trace",
                                },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            type = {
                                castNumberToInteger = true,
                            },
                            diagnostics = {
                                disable = { "incomplete-signature-doc", "trailing-space" },
                                -- enable = false,
                                groupSeverity = {
                                    strong = "Warning",
                                    strict = "Warning",
                                },
                                groupFileStatus = {
                                    ["ambiguity"] = "Opened",
                                    ["await"] = "Opened",
                                    ["codestyle"] = "None",
                                    ["duplicate"] = "Opened",
                                    ["global"] = "Opened",
                                    ["luadoc"] = "Opened",
                                    ["redefined"] = "Opened",
                                    ["strict"] = "Opened",
                                    ["strong"] = "Opened",
                                    ["type-check"] = "Opened",
                                    ["unbalanced"] = "Opened",
                                    ["unused"] = "Opened",
                                },
                                unusedLocalExclude = { "_*" },
                            },
                            format = {
                                enable = false,
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "2",
                                    continuation_indent_size = "2",
                                },
                            },
                        },
                    },
                },
            },
            setup = {},
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "<c-k>", false, mode = "i" }
        end,
    },
}
