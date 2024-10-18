vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

if not vim.g.vscode then
    require("conform").setup({
        formatters = {
            stylua = {
                prepend_args = { "--indent-width", "4", "--indent-type", "Spaces" },
            },
        },
    })
end
