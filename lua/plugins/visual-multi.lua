---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        options = {
          g = {
            ["Find Under"] = "<C-n>",
            ["Find Subword Under"] = "<C-n>",
            ["Add Cursor Up"] = "<M-k>",
            ["Add Cursor Down"] = "<M-j>",
            ["Select All Words"] = "<C-M-n>",
            ["Skip Region"] = "<C-x>",
          },
        },
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "BufEnter",
  },
}
