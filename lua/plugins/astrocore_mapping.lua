return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        ["j"] = { "gj" },
        ["k"] = { "gk" },
        ["<C-M-h>"] = { "0" },
        ["<C-M-j>"] = { "5j" },
        ["<C-M-k>"] = { "5k" },
        ["<C-M-l>"] = { "$" },
        ["<S-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo({ buflisted = 1 })
            require("astrocore.buffer").close(0)
            if
              require("astrocore").is_available("alpha-nvim") and not bufs[2]
            then
              require("alpha").start()
            end
          end,
          desc = "Close buffer",
        },
      },
      i = {
        ["jk"] = { "<Esc>", desc = "quick exit insert mode" },
        ["<C-h>"] = { "<Left>" },
        ["<C-j>"] = { "<Down>" },
        ["<C-k>"] = { "<Up>" },
        ["<C-l>"] = { "<Right>" },
        ["<C-M-h>"] = { "<Home>" },
        ["<C-M-j>"] = { "<Down><Down><Down><Down><Down>" },
        ["<C-M-k>"] = { "<Up><Up><Up><Up><Up>" },
        ["<C-M-l>"] = { "<End>" },
      },
      v = {
        ["<C-M-h>"] = { "0" },
        ["<C-M-j>"] = { "5j" },
        ["<C-M-k>"] = { "5k" },
        ["<C-M-l>"] = { "$" },
      },
      t = {},
    },
  },
}
