if true then return {} end

return {
  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup({
        keys = "etovxqpdygfblzhckisuran",
        case_insensitive = false,
        create_hl_autocmd = false,
        current_line_only = false,
        multi_windows = true,
      })
      vim.api.nvim_set_keymap("n", "s", "<Cmd>HopChar1<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<M-s>", "<Cmd>HopAnywhere<CR>", { silent = true })
      vim.api.nvim_set_keymap("v", "s", "<Cmd>HopChar1<CR>", { silent = true })
      vim.api.nvim_set_keymap("v", "<M-s>", "<Cmd>HopAnywhere<CR>", { silent = true })
    end,
    specs = {
      {
        "catppuccin",
        optional = true,
        opts = { integrations = { hop = true } },
      },
    },
  },
}
