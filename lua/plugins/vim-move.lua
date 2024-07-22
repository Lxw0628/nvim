return {
  "matze/vim-move",
  event = { "InsertEnter" },
  specs = {
    {
      "echasnovski/mini.move",
      optional = true,
      enabled = false,
    },
  },
}
