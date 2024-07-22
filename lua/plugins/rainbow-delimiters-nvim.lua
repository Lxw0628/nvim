return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    specs = {
      {
        "catppuccin",
        optional = true,
        opts = { integrations = { rainbow_delimiters = true } },
      },
    },
    event = "VeryLazy",
    main = "rainbow-delimiters.setup",
    config = function()
      vim.keymap.set("n", "<Leader>u(", function()
        local bufnr = vim.api.nvim_get_current_buf()
        require("rainbow-delimiters").toggle(bufnr)
        vim.notify(
          string.format(
            "Buffer rainbow delimeters %s",
            require("rainbow-delimiters").is_enabled(bufnr) and "on" or "off"
          )
        )
      end, { desc = "Toggle rainbow delimeters (buffer)" })
    end,
  },
}
