if not vim.g.vscode then
  return {}
end

local enabled = {
  "dial.nvim",
  "lazy.nvim",
  "flash.nvim",
  "mini.ai",
  "mini.comment",
  "mini.move",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "ts-comments.nvim",
  "vim-repeat",
  "yanky.nvim",
  -- "LazyVim",
  "nvim-toggler",
  "treesj",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

local vscode = require("vscode")
vim.notify = vscode.notify

local function findKeymap()
  vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
end

-- Code
local function codeKeymap()
  vim.keymap.set("n", "<leader>cs", function()
    vscode.call("workbench.action.gotoSymbol")
  end)
end

function keymaps()
  -- Find
  findKeymap()
  -- Code
  codeKeymap()
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    keymaps()
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
