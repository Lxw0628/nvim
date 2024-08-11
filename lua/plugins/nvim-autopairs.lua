return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
    specs = {
      {
        "echasnovski/mini.pairs",
        optional = true,
        enabled = false,
      },
    },
  },
}
