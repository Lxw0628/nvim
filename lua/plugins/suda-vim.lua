return {
  "lambdalisue/suda.vim",
  cmd = { "SudaRead", "SudaWrite" },
  init = function()
    vim.keymap.set("n", "<Leader>W", "<Cmd>SudaWrite<CR>", { desc = "Suda Write" })
  end,
}
