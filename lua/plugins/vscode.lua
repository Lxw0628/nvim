if not vim.g.vscode then
  return {}
end

local enabled = {
  "dial.nvim",
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
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
  "LazyVim",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

local vscode = require("vscode")
vim.notify = vscode.notify

local map = vim.keymap.set
-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    -- Ctrl + / 切换行注释
    map("n", "<C-/>", "<Nop>")
    map("n", "<C-/>", function ()
      vscode.action("editor.action.commentLine")
    end)

    map("n", "za", function()
      vscode.action("editor.toggleFold")
    end)
    map("n", "zM", function()
      vscode.action("editor.foldAll")
    end)
    map("n", "zR", function()
      vscode.action("editor.unfoldAll")
    end)
    -- map("v", "zf", function()
    --   vscode.action("editor.createFoldingRangeFromSelection")
    -- end)
    map("v", "zf", "<cmd>lua require('vscode').action('editor.createFoldingRangeFromSelection')<CR><ESC>")
    map("n", "zd", function()
      vscode.action("editor.removeManualFoldingRanges")
    end)

    map("n", "H", "<Nop>")
    map("n", "L", "<Nop>")
    map("n", "H", function()
      vscode.action("workbench.action.previousEditor")
    end)
    map("n", "L", function()
      vscode.action("workbench.action.nextEditor")
    end)

    -- Buffer
    map("n", "<leader>bd", function()
      vscode.action("workbench.action.closeActiveEditor")
    end)
    map("n", "<leader>bo", function()
      vscode.action("workbench.action.closeOtherEditors")
    end)
    map("n", "<leader>br", function()
      vscode.action("workbench.action.closeEditorsToTheRight")
    end)
    map("n", "<leader>bl", function()
      vscode.action("workbench.action.closeEditorsToTheLeft")
    end)

    -- Code
    map("n", "<leader>cf", function()
      vscode.action("editor.action.formatDocument")
    end)
    map("n", "<leader>cF", function()
      vscode.action("editor.action.formatDocument.multiple")
    end)
    map("n", "<leader>cr", function()
      vscode.action("editor.action.rename")
    end)
    map("n", "<leader>ca", function()
      vscode.action("editor.action.quickFix")
    end)
    map("n", "<leader>cA", function()
      vscode.action("editor.action.sourceAction")
    end)

    -- Debug
    map("n", "<leader>db", function()
      vscode.action("editor.debug.action.toggleBreakpoint")
    end)

    -- File/Find

    -- Git

    -- Quit/Session

    -- Refactor

    -- Search
    map("n", "<leader>ss", function()
      vscode.action("workbench.action.gotoSymbol")
    end)

    -- Test

    -- Ui
    map("n", "<leader>ur", "<cmd>noh<cr>")
    map("n", "<leader>uw", function()
      vscode.action("editor.action.toggleWordWrap")
    end)
    map("n", "<leader>un", function()
      vscode.action("notifications.clearAll")
    end)
    map("n", "<leader>uz", function ()
      vscode.action("workbench.action.toggleZenMode")
    end)

    -- Windows

    -- Diagnostics/Quickfix

    -- Codeium

    -- Tabs
  end,
})

function LazyVim.terminal()
  require("vscode").action("workbench.action.terminal.toggleTerminal")
end

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
  {
    "vscode-neovim/vscode-multi-cursor.nvim",
    event = "VeryLazy",
    cond = not not vim.g.vscode,
    opts = {
      -- Whether to set default mappings
      default_mappings = true,
      -- If set to true, only multiple cursors will be created without multiple selections
      no_selection = false,
    },
  },
}
