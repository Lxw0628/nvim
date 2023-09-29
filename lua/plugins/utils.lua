return {
  -- {
  --     "nvim-tree/nvim-tree.lua",
  --     cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  --     event = "User DirOpened",
  --     keys = {
  --         {
  --             "<leader>e",
  --             mode = { "n" },
  --             "<Cmd>NvimTreeToggle<CR>",
  --             desc = "文件树"
  --         }
  --     },
  --     config = function()
  --         -- disable netrw at the very start of your init.lua
  --         vim.g.loaded_netrw = 1
  --         vim.g.loaded_netrwPlugin = 1
  --         require("nvim-tree").setup({
  --             sort_by = "case_sensitive",
  --             view = {
  --                 width = 30,
  --             },
  --             renderer = {
  --                 group_empty = true,
  --             },
  --             filters = {
  --                 dotfiles = true,
  --             },
  --         })
  --     end,
  -- },
  {
    "terryma/vim-expand-region",
    keys = {
      { "v", "<Plug>(expand_region_expand)", { silent = true }, mode = { "v" } },
      { "V", "<Plug>(expand_region_shrink)", { silent = true }, mode = { "v" } },
    },
    config = function()
      vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { silent = true })
      vim.keymap.set("v", "V", "<Plug>(expand_region_shrink)", { silent = true })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "wyeb"
      vim.g.mkdp_markdown_css = "~/.config/nvim/colors/markdown.css"
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
      vim.g.mkdp_theme = "dark"
      vim.g.vmt_fence_text = "markdown-toc"
      vim.keymap.set("n", "<F5>", "<Plug>MarkdownPreviewToggle")
      vim.g.mkdp_auto_start = 1
    end,
  },
  -- ranger file explorer window
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  -- autoclose and autorename html tag
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "turbio/bracey.vim",
    event = "VeryLazy",
    cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
    build = "npm install --prefix server",
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "simrat39/symbols-outline.nvim",
    event = "VeryLazy",
    config = function()
      require("symbols-outline").setup()
    end,
  },
}
