local prefix = "<Leader>C"
return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight" },
  init = function()
    vim.keymap.set("v", prefix, "", { desc = " CodeSnap" })
    vim.keymap.set("v", prefix .. "s", ":'<,'>CodeSnap<CR>", { desc = "CodeSnap (clipboard)" })
    vim.keymap.set("v", prefix .. "S", ":'<,'>CodeSnapSave<CR>", { desc = "CodeSnap (save)" })
    vim.keymap.set("v", prefix .. "a", ":'<,'>CodeSnapASCII<CR>", { desc = "CodeSnap (ASCII)" })
    vim.keymap.set("v", prefix .. "h", ":'<,'>CodeSnapHighlight<CR>", { desc = "CodeSnap with highlight (clipboard)" })
    vim.keymap.set("v", prefix .. "H", ":'<,'>CodeSnapSaveHighlight<CR>", { desc = "CodeSnap with highlight (save)" })
  end,
  opts = {
    save_path = "~/Pictures/Codesnap",
    mac_window_bar = false,
    has_breadcrumbs = false,
    has_line_number = true,
    bg_color = "#1e1e2e",
    bg_padding = 0,
    watermark = "",
  },
}
