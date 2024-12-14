return {
    "andersevenrud/nvim_context_vt",
    event = "VeryLazy",
    cmd = { "NvimContextVtToggle" },
    init = function()
        vim.keymap.set("n", "<Leader>uv", function()
            require("nvim_context_vt").toggle_context()
        end, { desc = "Toggle virutal text context" })
    end,
    opts = {
        enabled = false,
    }
}
