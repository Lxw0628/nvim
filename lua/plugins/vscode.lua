local vscode = require("vscode")
local function mapMove(key, direction)
    vim.keymap.set("n", key, function()
        local count = vim.v.count
        local v = 1
        local style = "wrappedLine"
        if count > 0 then
            v = count
            style = "line"
        end
        vscode.action("cursorMove", {
            args = {
                to = direction,
                by = style,
                value = v,
            },
        })
    end)
end

if vim.g.vscode then
    -- clear vscode specific keymaps in vscode.lua
    vim.api.nvim_clear_autocmds({
        event = "User",
        pattern = "LazyVimKeymapsDefaults",
    })
    local map = vim.keymap.set
    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimKeymapsDefaults",
        callback = function()
            -- 解决跨过foll自动展开的问题
            mapMove("j", "down")
            mapMove("k", "up")

            -- Ctrl + / 切换行注释
            map("n", "<C-/>", function()
                map("n", "<C-/>", "<Nop>")
                vscode.action("editor.action.commentLine")
            end)

            map("n", "za", function()
                vscode.action("editor.toggleFold")
            end)
            map("n", "zM", function()
                vscode.action("editor.foldAll")
            end)
            map("n", "zR", function()
                vscode.action("editor.unfoldAll")
            end)
            map("v", "zf", function()
                vscode.action("editor.createFoldingRangeFromSelection")
                vscode.action("vscode-neovim.escape")
            end)
            map("n", "zd", function()
                vscode.action("editor.removeManualFoldingRanges")
            end)

            map("n", "H", "<Nop>")
            map("n", "L", "<Nop>")
            map("n", "H", function()
                vscode.action("workbench.action.previousEditor")
            end)
            map("n", "L", function()
                vscode.action("workbench.action.nextEditor")
            end)

            -- Buffer
            map("n", "<leader>bd", function()
                vscode.action("workbench.action.closeActiveEditor")
            end)
            map("n", "<leader>bo", function()
                vscode.action("workbench.action.closeOtherEditors")
            end)
            map("n", "<leader>br", function()
                vscode.action("workbench.action.closeEditorsToTheRight")
            end)
            map("n", "<leader>bl", function()
                vscode.action("workbench.action.closeEditorsToTheLeft")
            end)

            -- Code
            map("n", "<leader>cf", function()
                vscode.action("editor.action.formatDocument")
            end)
            map("n", "<leader>cF", function()
                vscode.action("editor.action.formatDocument.multiple")
            end)
            map("n", "<leader>cr", function()
                vscode.action("editor.action.rename")
            end)
            map("n", "<leader>ca", function()
                vscode.action("editor.action.quickFix")
            end)
            map("n", "<leader>cA", function()
                vscode.action("editor.action.sourceAction")
            end)
            map("n", "<leader>cs", function()
                vscode.action("workbench.action.gotoSymbol")
            end)

            -- Debug
            map("n", "<leader>db", function()
                vscode.action("editor.debug.action.toggleBreakpoint")
            end)

            -- File/Find

            -- Git

            -- Quit/Session

            -- Refactor

            -- Search

            -- Test

            -- Ui
            map("n", "<leader>ur", "<cmd>noh<cr>")
            map("n", "<leader>uw", function()
                vscode.action("editor.action.toggleWordWrap")
            end)
            map("n", "<leader>un", function()
                vscode.action("notifications.clearAll")
            end)
            map("n", "<leader>uz", function()
                vscode.action("workbench.action.toggleZenMode")
            end)
            map("n", "<leader>uc", function()
                vscode.action("workbench.action.toggleCenteredLayout")
            end)
            map("n", "<leader>us", function()
                vscode.action("workbench.action.toggleSidebarPosition")
            end)

            -- Windows

            -- Diagnostics/Quickfix

            -- Codeium

            -- Tabs
        end,
    })
end

return {}
