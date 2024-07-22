return {
  "debugloop/telescope-undo.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "debugloop/telescope-undo.nvim",
        config = function()
          vim.keymap.set("n", "<Leader>fu", "<Cmd>Telescope undo<CR>", { desc = "Find undos" })
        end,
      },
      opts = function()
        require("telescope").load_extension("undo")
      end,
    },
  },
}
