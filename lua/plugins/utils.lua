return {
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
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "aurum77/live-server.nvim",
    enabled = false,
    build = function()
      require("live_server.util").install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop", "LiveServerInstall" },
    config = function()
      local status_ok, live_server = pcall(require, "live_server")
      if not status_ok then
        return
      end
      live_server.setup({
        port = 5600,
        browser_command = "microsoft-edge-stable", -- Command or executable path
        quiet = false,
        no_css_inject = false,
        install_path = vim.fn.stdpath("config") .. "\\live-server\\",
      })
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = false, -- #RRGGBBAA hex codes
          AARRGGBB = false, -- 0xAARRGGBB hex codes
          rgb_fn = false, -- CSS rgb() and rgba() functions
          hsl_fn = false, -- CSS hsl() and hsla() functions
          css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "background", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = false, -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false,
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      })
    end,
  },
  {
    "voldikss/vim-translator",
    config = function()
      vim.keymap.set("n", "m", "<Plug>TranslateW")
      vim.keymap.set("v", "m", "<Plug>TranslateWV")
    end,
  },
  {
    -- 导致inlay_hint无法正常显示
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    config = function(_, opts)
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
      opts["fold_virt_text_handler"] = handler
      require("ufo").setup(opts)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
          -- vim.cmd [[ Lspsaga hover_doc ]]
        end
      end, { noremap = true, nowait = true })
    end,
  },
}
