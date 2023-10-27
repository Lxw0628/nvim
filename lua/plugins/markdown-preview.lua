return {
    {
        "iamcco/markdown-preview.nvim",
        event = "VeryLazy",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_browser = "wyeb"
            vim.g.mkdp_markdown_css = "~/.config/nvim/colors/markdown.css"
            vim.g.mkdp_page_title = "${name}"
            vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
            vim.g.mkdp_theme = "dark"
            vim.g.vmt_fence_text = "markdown-toc"
            vim.keymap.set("n", "<F5>", "<Plug>MarkdownPreviewToggle")
            vim.g.mkdp_auto_start = 1
        end,
    },
}
