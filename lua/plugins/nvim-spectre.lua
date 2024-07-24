if true then return {} end

return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  init = function()
    local prefix = "<Leader>S"
    vim.keymap.set("n", prefix, "", { desc = "Search / Replace" })
    vim.keymap.set("n", prefix .. "s", function()
      require("spectre").open()
    end, { desc = "Spectre" })
    vim.keymap.set("n", prefix .. "f", function()
      require("spectre").open_file_search()
    end, { desc = "Spectre (current file)" })
    vim.keymap.set("x", prefix, "", { desc = "Search / Replace" })
    vim.keymap.set("x", prefix .. "w", function()
      require("spectre").open_visual({ select_word = true })
    end, { desc = "Spectre (current word)" })
  end,
  specs = {
    {
      "folke/edgy.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.bottom then
          opts.bottom = {}
        end
        table.insert(opts.bottom, { ft = "spectre_panel", title = "Search/Replace", size = { height = 0.4 } })
      end,
    },
  },
  opts = function()
    return {
      mapping = {
        send_to_qf = { map = "q" },
        replace_cmd = { map = "c" },
        show_option_menu = { map = "o" },
        run_current_replace = { map = "C" },
        run_replace = { map = "R" },
        change_view_mode = { map = "v" },
        resume_last_search = { map = "l" },
      },
    }
  end,
}
