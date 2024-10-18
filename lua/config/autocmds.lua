-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    desc = "Start leetcode.nvim on startup",
    nested = true,
    callback = function()
        if vim.fn.argc() ~= 1 then
            return
        end -- return if more than one argument given
        local arg = "leetcode.nvim"
        if vim.fn.argv()[1] ~= arg then
            return
        end -- return if argument doesn't match trigger
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
        if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then
            return
        end -- return if buffer is non-empty
        require("leetcode").start(true)
    end,
})

-- disabled spell and diagnostic to markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.spell = false
        vim.diagnostic.enable(false)
    end,
})
