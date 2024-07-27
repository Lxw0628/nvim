if true then return {} end

--  [markdown markmap]
--  https://github.com/Zeioth/markmap.nvim
return {
  "Zeioth/markmap.nvim",
  build = "npm -g i markmap-cli",
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  ft = "markdown",
  opts = {
    hide_toolbar = "false",
  },
  specs = {
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
      },
      opts = function()
        require("mason-null-ls").setup({
          ensure_installed = { "markmap-cli" },
          automatic_installation = true,
          handlers = {},
        })
      end,
    },
  },
}
