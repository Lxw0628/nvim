local function list_index(t, value)
  for i, v in ipairs(t) do
    if v == value then
      return i
    end
  end
  return nil
end

return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-1),
        ["<C-f>"] = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
        ["<CR>"] = cmp.config.disable,
        ["<C-N>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "c" }),
        ["<C-P>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "c" }),
        -- ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        -- ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ["<C-CR>"] = function(fallback)
        --   cmp.abort()
        --   fallback()
        -- end,
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if true then
            if cmp.visible() then
              cmp.confirm()
            else
              fallback()
            end
          else
            if cmp.visible() and has_words_before() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end
        end, { "i", "c" }),
      })
    end,
    main = "lazyvim.util.cmp",
  },

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "hrsh7th/cmp-calc", lazy = true },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "calc" })
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = function()
      local cmp = require("cmp")
      return {
        {
          type = "/",
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        },
        {
          type = ":",
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      vim.tbl_map(function(val)
        cmp.setup.cmdline(val.type, val)
      end, opts)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      if not opts.sources then
        opts.sources = {}
      end
      table.insert(opts.sources, { name = "emoji", priority = 700 })
    end,
  },
  -- {
  --   "petertriho/cmp-git",
  --   ft = { "gitcommit", "octo", "NeogitCommitMessage" },
  --   dependencies = { "hrsh7th/nvim-cmp" },
  --   opts = function(_, opts)
  --     opts.filetypes = require("lazy.core.plugin").values(assert(require("astrocore").get_plugin("cmp-git")), "ft")
  --   end,
  --   config = function(_, opts)
  --     if opts.filetypes then
  --       local cmp = require("cmp")
  --       cmp.setup.filetype(opts.filetypes, {
  --         sources = cmp.config.sources({
  --           { name = "git" },
  --         }, {
  --           { name = "buffer" },
  --         }),
  --       })
  --     end
  --     require("cmp_git").setup(opts)
  --   end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "hrsh7th/cmp-latex-symbols" },
    opts = function(_, opts)
      if not opts.sources then
        opts.sources = {}
      end
      table.insert(opts.sources, { name = "latex_symbols", priority = 700 })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "chrisgrieser/cmp-nerdfont" },
    opts = function(_, opts)
      if not opts.sources then
        opts.sources = {}
      end
      table.insert(opts.sources, { name = "nerdfont", priority = 700 })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "hrsh7th/cmp-nvim-lua", lazy = true },
    opts = function(_, opts)
      if not opts.sources then
        opts.sources = {}
      end
      table.insert(opts.sources, { name = "nvim_lua" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "f3fora/cmp-spell", lazy = true },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "spell" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "lukas-reineke/cmp-under-comparator", lazy = true },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sorting = opts.sorting or {}
      -- If comparators is not set, use the default. get_config() has defaults now.
      opts.sorting.comparators = opts.sorting.comparators or cmp.get_config().sorting.comparators
      -- Find element in comparators we will position ourselves after.
      -- Position after recently_used, fallback to after score, fallback to 4th position.
      -- recently_used was not in nvim-cmp some time ago.
      local pos = list_index(opts.sorting.comparators, cmp.config.compare.recently_used)
      if pos == nil then
        pos = list_index(opts.sorting.comparators, cmp.config.compare.score)
      end
      if pos == nil then
        pos = 3
      end
      table.insert(opts.sorting.comparators, pos + 1, require("cmp-under-comparator").under)
    end,
  },
}
