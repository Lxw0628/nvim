return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "清除所有通知",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        update_in_insert = false,

      },
      servers = {

      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
      autoformat = false,
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { -- 删除kepmap
        "<leader>,",
        false,
      },
      {
        "<leader><Space>",
        "<cmd>Telescope buffers show_all_buffers=true<cr>",
        desc = "Swiwch Buffer",
      },
      { -- 删除keymap
        "<leader>/",
        false,
      },
      {
        "<leader>fb",
        false,
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", false },
      { "<leader>bD", false },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "切换Buffer标记" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "删除所有没被标记的Buffer" },
    },
  },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "<leader>/",

        -- Toggle comment on current line
        comment_line = "<leader>/",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "<leader>/",
      },
    },
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "文档诊断 (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "工作区诊断 (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "位置列表 (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "快速修复列表 (Trouble)" },
    },
  },
  {
    "folke/persistence.nvim",
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "清空会话记录",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "恢复上次会话",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "不保存当前会话",
      },
    },
  },
  {
    "folke/edgy.nvim",
    opts = {
        right = {
          {
            ft = "Outline",
            pinned = true,
            open = "SymbolsOutlineOpen",
          },
        },
      },
    },
}
