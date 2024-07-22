return {
  "Exafunction/codeium.nvim",
  cmd = "Codeium",
  build = ":Codeium Auth",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts)
        -- Inject codeium into cmp sources, with high priority
        table.insert(opts.sources, 1, {
          name = "codeium",
          group_index = 1,
          priority = 10000,
        })
      end,
    },
  },
  opts = {
    enable_chat = true,
  },
  config = function()
    -- https://github.com/Exafunction/codeium.nvim/issues/136
    local Source = require("codeium.source")

    local function is_codeium_enabled()
      local enabled = vim.b["codeium_enabled"]
      if enabled == nil then
        enabled = vim.g["codeium_enabled"]
        if enabled == nil then
          enabled = true -- enable by default
        end
      end
      return enabled
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    function Source:is_available()
      local enabled = is_codeium_enabled()
      ---@diagnostic disable-next-line: undefined-field
      return enabled and self.server.is_healthy()
    end

    vim.api.nvim_set_keymap("n", "<leader>;", "", { desc = "Codeium" })
    vim.api.nvim_set_keymap("n", "<leader>;;", "", {
      callback = function()
        local new_enabled = not is_codeium_enabled()
        vim.b["codeium_enabled"] = new_enabled
        if new_enabled then
          vim.notify("Codeium enabled in buffer")
        else
          vim.notify("Codeium disabled in buffer")
        end
      end,
      noremap = true,
      desc = "Toggle Codeium",
    })
  end,
}
