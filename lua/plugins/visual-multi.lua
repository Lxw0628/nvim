-- if true then return {} end

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        options = {
          g = {
            -- *g.VM_* DOC:
            -- https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-settings.txt
            VM_theme = "ocean",

            -- 禁用默认映射（除了<C-n>）
            VM_default_mappings = 0,

            -- 鼠标映射, 0 = 禁用; 1 = 启用
            -- Ctrl+LeftMouse: 点击位置添加光标
            -- Ctrl+RightMouse: 选择点击的单词
            -- Alt+Ctrl+RightMouse: 创建光标列
            VM_mouse_mappings = 1,

            -- leader 默认为'\\'
            -- VM_leader = { "<Space>" },

            -- On line 24 of the settings doc
            --  Enable statusline when VM is active.
            --  With a value of 1, the statusline will be set once, on VM start.
            --  With a value of 2, the statusline will be refreshed on |CursorHold| event.
            --  With a value of 3, also on |CursorMoved| event.
            VM_set_statusline = 1,

            -- On line 32 of the settings doc
            --  Don't display a message when exiting VM. You may prefer it if you already set
            --  up statusline integration.
            VM_silent_exit = 1,

            -- On line 45 of the settings doc
            --  When starting VM by adding a single cursor at position, don't enable buffer
            --  mappings, so that you can keep moving freely the cursor to add more cursors
            --  elsewhere.
            VM_add_cursor_at_pos_no_mappings = 1,
            VM_maps = {
              ["Undo"] = "u",
              ["Redo"] = "<C-r>",
              -- Normal Mode Maps
              ["Find Under"] = "<M-n>",
              ["Find Subword Under"] = "<M-n>",
              ["Select All"] = "<M-a>",
              ["Select h"] = "<M-Left>",
              ["Select l"] = "<M-Right>",
              ["Start Regex Search"] = "",
              ["Add Cursor Down"] = "<M-Down>",
              ["Add Cursor Up"] = "<M-Up>",
              -- ["Add Cursor At Pos"] = "<M-p>",
              ["Skip Region"] = "q",
              ["Remove Region"] = "Q",
            },
          },
        },
      })
    end,
  },
}
