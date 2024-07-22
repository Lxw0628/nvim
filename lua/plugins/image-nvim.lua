if true then return {} end

return {
  "3rd/image.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      optional = true,
      config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
          ensure_installed = { "markdown", "markdown_inline" },
        })
      end,
      -- opts = {
      --   ensure_installed = { "markdown", "markdown_inline" },
      --   auto_install = true,
      -- },
    },
    "https://github.com/leafo/magick",
  },
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "norg" },
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    kitty_method = "normal",
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
  },
}
