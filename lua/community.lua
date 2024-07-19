-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" }, -- A snazzy bufferline for Neovim
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" }, -- IDE-like breadcrumbs, out of the box
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" }, -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  { import = "astrocommunity.bars-and-lines.scope-nvim" }, -- Revolutionize Your Neovim Tab Workflow: Introducing Enhanced Tab Scoping!
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- A Neovim plugin hiding your colorcolumn when unneeded.
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" }, -- Status column plugin that provides a configurable 'statuscolumn' and click handlers.
  { import = "astrocommunity.bars-and-lines.vim-illuminate" }, -- (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  { import = "astrocommunity.code-runner.overseer-nvim" }, -- A task runner and job management plugin for Neovim
  { import = "astrocommunity.code-runner.sniprun" }, -- A neovim plugin to run lines/blocs of code (independently of the rest of the file), supporting multiples languages
  { import = "astrocommunity.color.ccc-nvim" }, -- Color picker and highlighter plugin for Neovim.
  { import = "astrocommunity.color.headlines-nvim" }, -- This plugin adds horizontal highlights for text filetypes, like markdown, orgmode, and neorg.
  { import = "astrocommunity.color.huez-nvim" }, -- All things color related. All Lua.
  -- { import = "astrocommunity.color.mini-hipatterns" }, -- Neovim Lua plugin to highlight patterns in text. Part of 'mini.nvim' library.
  { import = "astrocommunity.color.nvim-highlight-colors" }, -- Highlight colors for neovim
  -- { import = "astrocommunity.color.tint-nvim" }, -- Dim inactive windows in Neovim using window-local highlight namespaces.
  { import = "astrocommunity.color.transparent-nvim" }, -- Remove all background colors to make nvim transparent
  { import = "astrocommunity.color.twilight-nvim" }, -- 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
  { import = "astrocommunity.colorscheme.catppuccin" }, -- 🍨 Soothing pastel theme for (Neo)vim
  { import = "astrocommunity.colorscheme.everforest" }, -- 🌲 Comfortable & Pleasant Color Scheme for Vim
  { import = "astrocommunity.comment.ts-comments-nvim" }, -- Tiny plugin to enhance Neovim's native comments
  { import = "astrocommunity.completion.cmp-calc" }, -- Calculation source for nvim-cmp
  { import = "astrocommunity.completion.cmp-cmdline" }, -- nvim-cmp source for vim's cmdline.
  { import = "astrocommunity.completion.cmp-emoji" }, -- nvim-cmp source for emoji
  { import = "astrocommunity.completion.cmp-git" }, -- Git source for nvim-cmp
  { import = "astrocommunity.completion.cmp-latex-symbols" }, -- Add latex symbol support for nvim-cmp.
  { import = "astrocommunity.completion.cmp-nerdfont" }, -- nvim-cmp source for nerdfont
  { import = "astrocommunity.completion.cmp-nvim-lua" }, -- nvim-cmp source for neovim Lua API.
  { import = "astrocommunity.completion.cmp-spell" }, -- spell source for nvim-cmp based on vim's spellsuggest.
  { import = "astrocommunity.completion.cmp-under-comparator" }, -- A tiny function for nvim-cmp to better sort completion items that start with one or more underlines.
  { import = "astrocommunity.completion.codeium-nvim" }, -- A native neovim extension for Codeium
  -- { import = "astrocommunity.completion.coq_nvim" }, -- Fast as FUCK nvim completion. SQLite, concurrent scheduler, hundreds of hours of optimization.
  { import = "astrocommunity.completion.nvim-cmp-buffer-lines" }, -- nvim-cmp source for buffer lines
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" }, --
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" }, --
  { import = "astrocommunity.pack.lua" }, --
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" }, --
  { import = "astrocommunity.recipes.auto-session-restore" }, --
  { import = "astrocommunity.recipes.telescope-lsp-mappings" }, --
  { import = "astrocommunity.recipes.vscode" }, --
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<F1>"] = false,
          ["<F2>"] = { function() require("nvcheatsheet").toggle() end, desc = "Cheatsheet" },
        },
      },
    },
  },
}
