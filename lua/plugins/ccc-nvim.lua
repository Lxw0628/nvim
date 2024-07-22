return {
  "uga-rosa/ccc.nvim",
  event = { "InsertEnter" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  specs = {
    { "NvChad/nvim-colorizer.lua", optional = true, enabled = false },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
  config = function(_, opts)
    require("ccc").setup(opts)
    if opts.highlighter and opts.highlighter.auto_enable then
      vim.cmd.CccHighlighterEnable()
    end

    vim.keymap.set("n", "<Leader>uC", "<Cmd>CccHighlighterToggle<CR>", { desc = "Toggle colorizer" })
    vim.keymap.set("n", "<Leader>z", "", { desc = "Ccc" })
    vim.keymap.set("n", "<Leader>zc", "<Cmd>CccConvert<CR>", { desc = "Convert color" })
    vim.keymap.set("n", "<Leader>zp", "<Cmd>CccPick<CR>", { desc = "Pick color" })
  end,
}
