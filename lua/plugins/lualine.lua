return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            lazy = true
        }
    },
    init = function() -- before this plugins is loaded.

    end,
    config = function() -- after this plugins is loaded.
        local config = {
            options = {
                icons_enabled = true,
                theme = 'tokyonight',
                component_separators = "",
                section_separators = "",
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        icons_enabled = true,
                        icon = nil,
                        separator = nil,
                        cond = nil,
                        draw_empty = true,
                        color = nil,
                        type = nil,
                        padding = 1,
                        fmt = nil,
                        on_click = nil,
                    }
                },
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        colored = true,
                        diff_color = {
                            added    = 'LuaLineDiffAdd',                          -- Changes the diff's added color
                            modified = 'LuaLineDiffChange',                       -- Changes the diff's modified color
                            removed  = 'LuaLineDiffDelete',                       -- Changes the diff's removed color you
                        },
                        symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
                        source = nil,                                             -- A function that works as a data source for diff.
                    },
                    {
                        'diagnostics',
                        -- Table of diagnostic sources, available sources are:
                        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                        sources = { 'nvim_lsp', 'coc' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        diagnostics_color = {
                            error = 'DiagnosticError', -- Changes diagnostics' error color.
                            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                        },
                        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                        colored = true,           -- Displays diagnostics status in color if set to true.
                        update_in_insert = false, -- Update diagnostics in insert mode.
                        always_visible = false,   -- Show diagnostics even if there are none.
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,     -- Displays file status (readonly status, modified status)
                        newfile_status = false, -- Display new file status (new file means no write after created)
                        path = 4,
                        -- 0: Just the filename
                        -- 1: Relative path
                        -- 2: Absolute path
                        -- 3: Absolute path, with tilde as the home directory
                        -- 4: Filename and parent dir, with tilde as the home directory
                        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                        -- for other components. (terrible name, any suggestions?)
                        symbols = {
                            modified = '[+]',      -- Text to show when the file is modified.
                            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            newfile = '[New]',     -- Text to show for newly created file before first write
                        }
                    }
                },
                lualine_x = { 'encoding', 'g:coc_status' },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { "nvim-tree" },
        }
        require('lualine').setup(config)
    end
}
