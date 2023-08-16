return {
    "nvimdev/guard.nvim",
    event = "VeryLazy",
    config = function()
        local ft = require("guard.filetype")

        ft("lua"):fmt("lsp"):append("stylua")
        ft("python"):fmt("black"):append("isort")
        ft("json"):fmt("jq")
        ft("sh"):fmt("shfmt")
        ft("html"):fmt("prettier")
        ft("css,sass,scss,less"):fmt("lsp"):append("prettier")
        ft("javascript,typescript"):fmt("prettier")
        ft("markdown"):fmt("cbfmt")

        require("guard").setup({
            fmt_on_save = false,
            lsp_as_default_formatter = true,
        })
    end,
}
