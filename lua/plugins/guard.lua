return {
    "nvimdev/guard.nvim",
    event = "VeryLazy",
    config = function()
        local ft = require("guard.filetype")

        ft("lua"):fmt("lsp"):append("stylua")
        ft("python"):fmt("black"):append("isort")
        ft("json"):fmt("jq")
        ft("sh"):fmt("shfmt"):lint("shellcheck")
        ft("html"):fmt("prettier"):list("markuplint")
        ft("css,sass,scss,less"):fmt("lsp"):append("prettier"):lint("stylelint")
        ft("javascript,typescript"):fmt("prettier"):lint("eslint_d")

        require("guard").setup({
            fmt_on_save = false,
            lsp_as_default_formatter = true,
        })
    end,
}
