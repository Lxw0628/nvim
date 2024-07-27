-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.bars-and-lines.bufferline-nvim" }, -- A snazzy bufferline for Neovim
  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" }, -- IDE-like breadcrumbs, out of the box
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" }, -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  -- { import = "astrocommunity.bars-and-lines.scope-nvim" }, -- Revolutionize Your Neovim Tab Workflow: Introducing Enhanced Tab Scoping!
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- A Neovim plugin hiding your colorcolumn when unneeded.
  -- { import = "astrocommunity.bars-and-lines.statuscol-nvim" }, -- Status column plugin that provides a configurable 'statuscolumn' and click handlers.
  -- { import = "astrocommunity.bars-and-lines.vim-illuminate" }, -- (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.

  { import = "astrocommunity.code-runner.overseer-nvim" }, -- A task runner and job management plugin for Neovim
  { import = "astrocommunity.code-runner.sniprun" }, -- A neovim plugin to run lines/blocs of code (independently of the rest of the file), supporting multiples languages

  { import = "astrocommunity.color.ccc-nvim" }, -- Color picker and highlighter plugin for Neovim.
  -- { import = "astrocommunity.color.headlines-nvim" }, -- This plugin adds horizontal highlights for text filetypes, like markdown, orgmode, and neorg.
  { import = "astrocommunity.color.huez-nvim" }, -- All things color related. All Lua.
  -- { import = "astrocommunity.color.mini-hipatterns" }, -- Neovim Lua plugin to highlight patterns in text. Part of 'mini.nvim' library.
  -- { import = "astrocommunity.color.nvim-highlight-colors" }, -- Highlight colors for neovim
  -- { import = "astrocommunity.color.transparent-nvim" }, -- Remove all background colors to make nvim transparent
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
  -- { import = "astrocommunity.completion.codeium-nvim" }, -- A native neovim extension for Codeium
  { import = "astrocommunity.completion.codeium-vim" }, -- A native neovim extension for Codeium
  -- { import = "astrocommunity.completion.coq_nvim" }, -- Fast as FUCK nvim completion. SQLite, concurrent scheduler, hundreds of hours of optimization.
  { import = "astrocommunity.completion.nvim-cmp-buffer-lines" }, -- nvim-cmp source for buffer lines

  { import = "astrocommunity.debugging.nvim-bqf" }, -- Better quickfix window in Neovim, polish old quickfix window.
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" }, -- Add syntax highlighting to the nvim-dap REPL buffer using treesitter.
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" }, -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.
  { import = "astrocommunity.debugging.telescope-dap-nvim" }, -- Integration for nvim-dap with telescope.nvim.

  -- { import = "astrocommunity.diagnostics.error-lens-nvim" }, -- An enhanced visual diagnostic display for Neovim, inspired by the Error Lens extension for Visual Studio Code.
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" }, -- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
  { import = "astrocommunity.diagnostics.trouble-nvim" }, -- 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.

  { import = "astrocommunity.editing-support.bigfile-nvim" }, -- Make editing big files faster 🚀
  -- { import = "astrocommunity.editing-support.comment-box-nvim" }, -- ✨ Clarify and beautify your comments using boxes and lines.
  { import = "astrocommunity.editing-support.dial-nvim" }, -- enhanced increment/decrement plugin for Neovim.
  -- { import = "astrocommunity.editing-support.mini-operators" }, -- Text edit operators. Part of 'mini.nvim' library.
  { import = "astrocommunity.editing-support.mini-splitjoin" }, -- Neovim Lua plugin to split and join arguments. Part of 'mini.nvim' library.
  { import = "astrocommunity.editing-support.neogen" }, -- A better annotation generator. Supports multiple languages and annotation conventions.
  { import = "astrocommunity.editing-support.nvim-context-vt" }, -- Virtual text context for neovim treesitter
  { import = "astrocommunity.editing-support.nvim-devdocs" }, -- nvim-devdocs is a plugin which brings DevDocs documentations into neovim. Install, search and preview documentations directly inside neovim in markdown format with telescope integration. You can also use custom commands like glow to render the markdown for a better experience.
  { import = "astrocommunity.editing-support.nvim-regexplainer" }, -- Describe the regexp under the cursor
  { import = "astrocommunity.editing-support.nvim-treesitter-context" }, -- Show code context.
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" }, -- This is a simple plugin that helps to end certain structures automatically. In Ruby, this means adding end after if, do, def, etc. This even works for languages nested inside other, such as Markdown with a Lua code block!
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" }, -- Rainbow delimiters for Neovim with Tree-sitter
  { import = "astrocommunity.editing-support.refactoring-nvim" }, -- The Refactoring library based off the Refactoring book by Martin Fowler
  -- { import = "astrocommunity.editing-support.stickybuf-nvim" }, -- Neovim plugin for locking a buffer to a window; Have you ever accidentally opened a file into your file explorer or quickfix window?
  { import = "astrocommunity.editing-support.suda-vim" }, -- suda is a plugin to read or write files with sudo command.
  { import = "astrocommunity.editing-support.telescope-undo-nvim" }, -- A telescope extension to view and search your undo tree 🌴
  { import = "astrocommunity.editing-support.treesj" }, -- Neovim plugin for splitting/joining blocks of code
  -- { import = "astrocommunity.editing-support.true-zen-nvim" }, -- 🦝 Clean and elegant distraction-free writing for NeoVim
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" }, -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/editing-support/ultimate-autopair-nvim
  -- { import = "astrocommunity.editing-support.undotree" }, -- The undo history visualizer for VIM
  -- { import = "astrocommunity.editing-support.vim-doge" }, -- (Do)cumentation (Ge)nerator for nearly 20 languages 📚 Generate proper code documentation with a single keypress. ⚡️🔥
  { import = "astrocommunity.editing-support.vim-move" }, -- Moves lines and selections in a more visual manner
  { import = "astrocommunity.editing-support.vim-visual-multi" }, -- Multiple cursors plugin for vim/neovim.
  -- { import = "astrocommunity.editing-support.wildfire-nvim" }, -- Smart selection of the closest text object. A modern successor to wildfire.vim, empowered with the superpower of treesitter.
  { import = "astrocommunity.editing-support.yanky-nvim" }, -- Improved Yank and Put functionalities for Neovim.
  { import = "astrocommunity.editing-support.zen-mode-nvim" }, -- Disables diagnostics, indentation, and winbar when entering Zen Mode.

  -- { import = "astrocommunity.file-explorer.mini-files" }, -- Status: Beta; Neovim Lua plugin to navigate and manipulate file system. Part of mini.nvim library
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" }, -- File Browser extension for telescope.nvim

  -- { import = "astrocommunity.fuzzy-finder.fzf-lua" }, -- Improved fzf.vim written in lua
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" }, -- An extension for telescope.nvim that allows you operate zoxide within Neovim.

  { import = "astrocommunity.game.leetcode-nvim" }, -- A Neovim plugin enabling you to solve LeetCode problems.

  { import = "astrocommunity.git.octo-nvim" }, -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor

  -- { import = "astrocommunity.icon.mini-icons" }, -- Icon provider. Part of 'mini.nvim' library.

  { import = "astrocommunity.indent.indent-tools-nvim" }, -- Neovim pluging for dealing with indentations

  -- { import = "astrocommunity.keybinding.mini-clue" }, -- Show next key clues. Part of the mini.nvim library.
  -- { import = "astrocommunity.keybinding.nvcheatsheet-nvim" }, -- NvChad cheatsheet as a standalone neovim plugin

  -- { import = "astrocommunity.lsp.actions-preview-nvim" }, -- Fully customizable previewer for LSP code actions.
  -- { import = "astrocommunity.lsp.coc-nvim" }, -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
  { import = "astrocommunity.lsp.garbage-day-nvim" }, -- Garbage collector that stops inactive LSP clients to free RAM.
  { import = "astrocommunity.lsp.inc-rename-nvim" }, -- Incremental LSP renaming based on Neovim's command-preview feature.
  -- { import = "astrocommunity.lsp.lsp-inlayhints-nvim" }, -- Partial implementation of LSP inlay hint. 行尾
  { import = "astrocommunity.lsp.lsp-lens-nvim" }, -- Neovim plugin for displaying reference and definition info upon functions like JB's IDEA.
  { import = "astrocommunity.lsp.lsp-signature-nvim" }, -- Show function signature when you type.
  { import = "astrocommunity.lsp.lsplinks-nvim" }, -- LSP textDocument/documentLink support for neovim
  -- { import = "astrocommunity.lsp.lspsaga-nvim" }, -- improve neovim lsp experience
  { import = "astrocommunity.lsp.nvim-java" }, -- Painless Java in Neovim
  { import = "astrocommunity.lsp.nvim-lint" }, -- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" }, -- Neovim plugin that adds support for file operations using built-in LSP by integrating with nvim-tree and neo-tree.
  { import = "astrocommunity.lsp.ts-error-translator-nvim" }, -- A Neovim port of Matt Pocock's ts-error-translator for VSCode for turning messy and confusing TypeScript errors into plain English.

  { import = "astrocommunity.markdown-and-latex.glow-nvim" }, -- A markdown preview directly in your neovim.
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" }, -- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
  { import = "astrocommunity.markdown-and-latex.markmap-nvim" }, -- Visualize your Markdown as mindmaps with markmap
  { import = "astrocommunity.markdown-and-latex.vimtex" }, -- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.

  { import = "astrocommunity.media.codesnap-nvim" }, -- 📸 Snapshot plugin with rich features that can make pretty code snapshots for Neovim
  { import = "astrocommunity.media.drop-nvim" }, -- 🍁 Fun little plugin that can be used as a screensaver and on your dashboard
  { import = "astrocommunity.media.pets-nvim" }, -- Display pets in your editor 🐱. NEED KITTY TERMINAL!
  -- { import = "astrocommunity.media.vim-wakatime" }, -- Vim plugin for automatic time tracking and metrics generated from your programming activity.

  -- { import = "astrocommunity.motion.before-nvim" }, -- Plugin for Neovim which tracks edit locations
  -- { import = "astrocommunity.motion.flash-nvim" }, -- flash.nvim lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.
  -- { import = "astrocommunity.motion.hop-nvim" }, -- disabled to use personal config in hop.lua, because of hop doesn't set any keybindings.
  { import = "astrocommunity.motion.mini-ai" }, -- Neovim Lua plugin to extend and create a/i textobjects. Part of 'mini.nvim' library.
  { import = "astrocommunity.motion.nvim-surround" }, -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
  -- { import = "astrocommunity.motion.nvim-tree-pairs" }, -- NeoVim plugin for jumping to the other end of the current Tree-sitter node
  -- { import = "astrocommunity.motion.tabout-nvim" }, -- tabout plugin for neovim
  { import = "astrocommunity.motion.vim-matchup" }, -- vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen. Supports both vim and neovim + tree-sitter.

  { import = "astrocommunity.neovim-lua-development.lazydev-nvim" }, -- Faster LuaLS setup for Neovim

  -- { import = "astrocommunity.note-taking.obsidian-nvim" }, -- A Neovim plugin for writing and navigating an Obsidian vault, written in Lua.
  { import = "astrocommunity.note-taking.venn-nvim" }, -- Draw ASCII diagrams in Neovim with ease.https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/note-taking/venn-nvim

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.chezmoi" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },

  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  -- { import = "astrocommunity.recipes.auto-session-restore" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.recipes.vscode" },

  -- { import = "astrocommunity.register.nvim-neoclip-lua" },

  -- { import = "astrocommunity.scrolling.mini-animate" },
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- { import = "astrocommunity.scrolling.nvim-scrollbar" },

  { import = "astrocommunity.search.nvim-spectre" },

  -- { import = "astrocommunity.snippet.nvim-snippets" },

  -- { import = "astrocommunity.split-and-window.edgy-nvim" },
  -- { import = "astrocommunity.split-and-window.minimap-vim" },
  { import = "astrocommunity.split-and-window.windows-nvim" },

  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.syntax.vim-cool" },
  { import = "astrocommunity.syntax.vim-easy-align" },

  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },

  { import = "astrocommunity.test.neotest" },

  -- { import = "astrocommunity.utility.mason-tool-installer-nvim" },
  { import = "astrocommunity.utility.neodim" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" },
  -- { import = "astrocommunity.utility.telescope-coc-nvim" },
  { import = "astrocommunity.utility.telescope-lazy-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },

  -- { import = "astrocommunity.workflow.bad-practices-nvim" },
  -- { import = "astrocommunity.workflow.hardtime-nvim" },
  -- { import = "astrocommunity.workflow.precognition-nvim" },
}
