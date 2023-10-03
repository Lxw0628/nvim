return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
    },
    init = function () -- before loaded.

    end,
    config = function() -- after loaded.
        vim.cmd [[colorscheme tokyonight-night]]
    end
}
