-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.g.vscode then
  -- VSCode extension
  -- vim.keymap.set("n", "H", '<cmd>lua require("vscode-neovim").action("workbench.action.previousEditor")<cr>', {})
  -- vim.keymap.set("n", "L", '<cmd>lua require("vscode-neovim").action("workbench.action.nextEditor")<cr>', {})
else
  require("config.lazy")
end
