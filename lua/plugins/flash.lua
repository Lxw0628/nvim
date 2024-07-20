-- if true then return {} end

return {
  "folke/flash.nvim",
  enabled = false,
  keys = {
    -- disable the default flash keymap
    { "S", mode = { "n", "x", "o" }, false },
  },
}
