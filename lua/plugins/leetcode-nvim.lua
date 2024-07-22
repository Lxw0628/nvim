return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" }, -- required by telescope
    { "MunifTanjim/nui.nvim" },

    -- optional
    { "rcarriga/nvim-notify", optional = true },
    { "nvim-tree/nvim-web-devicons", optional = true },
    { "nvim-treesitter/nvim-treesitter", optional = true },
  },
  opts = {
    lang = "javascript",
    cn = {
      enabled = true,
    }
  },
}
