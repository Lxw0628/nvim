-- if true then return {} end

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
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "markmap-cli",
        },
      },
    },
  },
}
