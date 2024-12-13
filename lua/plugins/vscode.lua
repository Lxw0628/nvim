---@diagnostic disable: no-unknown
if vim.g.vscode then
    -- clear vscode specific keymaps in vscode.lua
    vim.api.nvim_clear_autocmds({
        event = "User",
        pattern = "LazyVimKeymapsDefaults",
    })
    local map = vim.keymap.set
    local vscode = require("vscode")
    vim.notify = vscode.notify
    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimKeymapsDefaults",
        callback = function()
            map("n", "j", "gj", { remap = true })
            map("n", "k", "gk", { remap = true })

            -- Ctrl + / 切换行注释
            map("n", "<C-/>", function()
                map("n", "<C-/>", "<Nop>")
                vscode.action("editor.action.commentLine")
            end)

            -- Fold 折叠
            map("n", "[z", function()
                vscode.action("editor.gotoPreviousFold")
            end)
            map("n", "]z", function()
                vscode.action("editor.gotoNextFold")
            end)
            map("n", "za", function()
                vscode.action("editor.toggleFold")
            end)
            map("n", "zA", function()
                vscode.action("editor.toggleFoldRecursively")
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
            map("n", "<leader>ba", function()
                vscode.action("workbench.action.closeAllEditors")
            end)
            map("n", "<leader>bp", function()
                if vscode.eval("return vscode.window.tabGroups.activeTabGroup.activeTab.isPinned") then
                    vscode.action("workbench.action.unpinEditor")
                else
                    vscode.action("workbench.action.pinEditor")
                end
            end)
            map("n", "<leader>bP", function()
                -- 关闭所有Non-Pinned的tab
                vscode.eval([[
                    vscode.window.tabGroups.all.forEach((tabGroup)=>{
                        tabGroup.tabs.forEach((tab)=>{
                            if(!tab.isPinned) vscode.window.tabGroups.close(tab);
                        })
                    })
                ]])
            end)
            map("n", "<leader>bl", function()
                vscode.action("workbench.action.moveEditorRightInGroup")
            end)
            map("n", "<leader>bh", function()
                vscode.action("workbench.action.moveEditorLeftInGroup")
            end)

            -- Code
            map("n", "]e", function()
                vscode.action("editor.action.marker.nextInFiles")
            end)
            map("n", "[e", function()
                vscode.action("editor.action.marker.prevInFiles")
            end)
            map("n", "]d", function()
                vscode.action("editor.action.marker.nextInFiles")
            end)
            map("n", "[d", function()
                vscode.action("editor.action.marker.prevInFiles")
            end)
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
            map("n", "<leader>cp", function()
                vscode.action("markdown.showPreviewToSide")
            end)

            -- Debug
            map("n", "<leader>db", function()
                vscode.action("editor.debug.action.toggleBreakpoint")
            end)

            -- File/Find

            -- Git

            -- Quit/Session

            -- Refactor
            map({ "n", "x" }, "<leader>r", function()
                vscode.with_insert(function()
                    vscode.action("editor.action.refactor")
                end)
            end)

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
            map("n", "<leader>uD", function()
                vscode.action("errorLens.toggle")
            end)
            map("n", "<leader>ul", function()
                local current_mode = vscode.get_config("editor.lineNumbers")
                if current_mode == "off" then
                    vscode.update_config("editor.lineNumbers", "on", "workspace")
                elseif current_mode == "on" then
                    vscode.update_config("editor.lineNumbers", "relative", "workspace")
                elseif current_mode == "relative" then
                    vscode.update_config("editor.lineNumbers", "off", "workspace")
                end
            end)

            -- Windows

            -- Diagnostics/Quickfix

            -- Codeium

            -- Tabs
        end,
    })
end

return {}
