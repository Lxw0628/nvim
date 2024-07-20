return {
  -- Change LuaSnip paths
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })
    end,
  },
}
