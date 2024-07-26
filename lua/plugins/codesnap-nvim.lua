local prefix = "<Leader>C"
return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight" },
  init = function()
    vim.keymap.set("x", prefix, "", { desc = " CodeSnap" })
    vim.keymap.set("x", prefix .. "s", ":'<,'>CodeSnap<CR>", { desc = "CodeSnap (clipboard)" })
    vim.keymap.set("x", prefix .. "S", ":'<,'>CodeSnapSave<CR>", { desc = "CodeSnap (save)" })
    vim.keymap.set("x", prefix .. "a", ":'<,'>CodeSnapASCII<CR>", { desc = "CodeSnap (ASCII)" })
    vim.keymap.set("x", prefix .. "h", ":'<,'>CodeSnapHighlight<CR>", { desc = "CodeSnap with highlight (clipboard)" })
    vim.keymap.set("x", prefix .. "H", ":'<,'>CodeSnapSaveHighlight<CR>", { desc = "CodeSnap with highlight (save)" })
  end,
  opts = {
    mac_window_bar = true,
    title = "CodeSnap.nvim",
    code_font_family = "Maple Mono SC NF",
    watermark_font_family = "Maple Mono SC NF",
    watermark = "",
    bg_theme = "bamboo",
    has_breadcrumbs = false,
    breadcrumbs_separator = "/",
    has_line_number = true,
    show_workspace = false,
    min_width = 0,
    bg_x_padding = 20,
    bg_y_padding = 20,
    bg_padding = nil,
    bg_color = "#535c68",
    save_path = "~/Pictures/Codesnap",
  },
}
