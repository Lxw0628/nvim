-- if true then return {} end
-- disabled in the astrocommunity to disable any keybinds, due to hop doesn't set any keybindings.

return {
  "smoka7/hop.nvim",
  opts = {},
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["s"] = { function() require("hop").hint_char1 { multi_windows = true } end, desc = "Hop hint char1" },
          ["<M-s>"] = {
            function() require("hop").hint_anywhere { multi_windows = true } end,
            desc = "Hop hint anywhere",
          },
        },
        v = {
          ["s"] = {
            function() require("hop").hint_char1 { extend_visual = true, multi_windows = true } end,
            desc = "Hop hint char1",
          },
          ["<M-s>"] = { function() require("hop").hint_anywhere { extend_visual = true, multi_windows = true } end, desc = "Hop hint words" },
        },
      },
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { hop = true } },
    },
  },
}
