-- if true then return {} end

return {
  "folke/flash.nvim",
  enabled = true,
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    -- disable the default flash keymap
    { "S", mode = { "n", "x", "o" }, false },
    { "r", mode = "o", false },
    { "R", mode = { "o", "x" }, false },
    { "<c-s>", mode = { "c" }, false },
  },
  -- https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    modes = {
      char = {
        -- disable 'f' 'F' 't' 'T' ';' ','
        keys = {},
      },
    },
  },
}
