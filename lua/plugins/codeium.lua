-- if true then return {} end

return {
  "Exafunction/codeium.nvim",
  config = function()
    require("codeium").setup({
      enable_chat = true,
    })

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

    local toggle = require("lazyvim.util.toggle")
    -- vim.api.nvim_set_keymap("n", "<Leader>;", "", { desc = "Codeium" })
    vim.keymap.set("n", "<Leader>;", "", { desc = "Codeium" })
    vim.keymap.set("n", "<Leader>;o", "<Cmd>Codeium Chat", { desc = "Codeium Chat" })
    toggle.map("<Leader>;;", {
      name = "Codeium",
      get = function()
        return is_codeium_enabled()
      end,
      set = function(state)
        if state then
          vim.b["codeium_enabled"] = true
        else
          vim.b["codeium_enabled"] = false
        end
      end,
    })

    local Source = require("codeium.source")
    --- save reference to library available function
    local superclass_is_available = Source.is_available
    --- overwrite the library built-in is_available function
    --- so that I can disable when I want to
    ---@diagnostic disable-next-line: duplicate-set-field
    function Source:is_available()
      return is_codeium_enabled() and superclass_is_available(self)
    end
  end,
}
