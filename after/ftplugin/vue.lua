vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

if not vim.g.vscode then
    require("conform").setup({
        formatters = {
            prettier = {
                prepend_args = { "--tab-width", "4" },
            },
        },
    })
end
