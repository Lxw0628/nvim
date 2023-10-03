return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function()  -- before loaded.
    end,
    config = function()  -- after loaded.
        vim.opt.termguicolors = true
        require("bufferline").setup()
    end
}
