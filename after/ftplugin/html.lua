vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

require("conform").setup({
    formatters = {
        prettier = {
            prepend_args = { "--tab-width", "4" },
        },
    },
})
