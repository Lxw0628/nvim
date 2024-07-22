return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  dependencies = {},
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
    })

    vim.keymap.set("n", "<Leader>uD", function()
      require("lsp_lines").toggle()
    end, { desc = "Toggle virtual diagnostic lines" })
  end,
}
