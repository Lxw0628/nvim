return {
  {
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
      arg = "leetcode.nvim",
      cn = {
        enabled = true,
      },
      ---@type fun()[]
      hooks = {
        ["enter"] = {},
        ["question_enter"] = {
          function()
            local prefix = "<Leader>L"
            local function judge()
              -- add mapping with which-key, show keybinds in whick-key when the neovim open the leetcode.nvim
              if next(require("leetcode.config").sessions.all) ~= nil then
                -- leetcode.nvim is started.
                return true
              else
                -- leetcode.nvim is closed.
                return false
              end
            end
            local judgment = judge()
            local table = {
              {
                prefix,
                group = "LeetCode",
                cond = judgment,
              },
              {
                prefix .. "q",
                "<Cmd>Leet exit<Cr>",
                cond = judgment,
                desc = "exit 关闭leetcode.nvim",
              },
              {
                prefix .. "r",
                "<Cmd>Leet run<Cr>",
                cond = judgment,
                desc = "run 运行当前打开的问题",
              },
              {
                prefix .. "R",
                "<Cmd>Leet reset<Cr>",
                cond = judgment,
                desc = "reset 还原到默认的代码模板",
              },
              {
                prefix .. "c",
                "<Cmd>Leet console<Cr>",
                cond = judgment,
                desc = "console 打开当前打开问题的控制台弹出窗口",
              },
              {
                prefix .. "i",
                "<Cmd>Leet info<Cr>",
                cond = judgment,
                desc = "info 打开包含当前打开问题信息的弹出窗口",
              },
              { prefix .. "s", "<Cmd>Leet submit<Cr>", cond = judgment, desc = "submit 提交当前打开的问题" },
              {
                prefix .. "S",
                "<Cmd>Leet last_submit<Cr>",
                cond = judgment,
                desc = "last_submit 检索上次提交的代码，用于当前问题",
              },
              {
                prefix .. "l",
                "<Cmd>Leet list<Cr>",
                cond = judgment,
                desc = "list 打开问题列表选择器",
              },
              {
                prefix .. "o",
                "<Cmd>Leet open<Cr>",
                cond = judgment,
                desc = "open 在默认浏览器中打开此问题",
              },
            }
            local wk = require("which-key")
            wk.add(table)
          end,
        },
        ["leave"] = {},
      },
      ---@type boolean
      image_support = false,
    },
  },
}
