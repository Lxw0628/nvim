local keyset = vim.keymap.set

keyset("n", "<leader>l", ":Vista coc<CR>", opts)

-- How each level is indented and what to prepend.
-- This could make the display more compact or more spacious.
-- e.g., more compact: ["▸ ", ""]
-- Note: this option only works for the kind renderer, not the tree renderer.
vim.cmd('let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]')

-- Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
vim.cmd('let g:vista#renderer#enable_icon = 1')

-- The default icons can't be suitable for all the filetypes, you can extend it as you wish.
vim.cmd('let g:vista#renderer#icons = {"function": "\\uf794","variable": "\\uf71b",}')
