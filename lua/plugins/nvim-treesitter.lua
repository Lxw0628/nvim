return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c_sharp",
        "css",
        "html",
        "ssh_config",
        "sxhkdrc",
      })
    end,
  },
}
