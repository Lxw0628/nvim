-- === mini-ai ===
require("mini.ai").setup()

-- === mini.align ==> vim-easy-align ===
require("mini.align").setup()

-- === mini.animate ===
-- require("mini.animate").setup()

-- === mini.base16 ===
-- require("mini.base16").setup()

-- === mini.basics ===
require("mini.basics").setup({
    mappings = {
        -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
        -- Supply empty string to not create these mappings.
        option_toggle_prefix = '',
        -- Window navigation with <C-hjkl>, resize with <C-arrow>
        windows = true,
    },
})

-- === mini.bufremove ===
require('mini.bufremove').setup()

-- === mini.comment ===
require("mini.comment").setup({
    mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = '<leader>/',
        -- Toggle comment on current line
        comment_line = '<leader>/',
        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = '',
    },
})

-- === mini.completion ===
-- require("mini.completion").setup()

-- === mini.cursorword ===
require("mini.cursorword").setup()

-- === mini.doc ===
-- require("mini.doc").setup()

-- === mini.fuzzy ===
-- require("mini.fuzzy").setup()

-- === mini.indentscope ===
require("mini.indentscope").setup()

-- === mini.jump ===
require("mini.jump").setup({
    mappings = {
        repeat_jump = '',
    }
})

-- === mini.jump2d ===
-- require("mini.jump2d").setup()

-- === mini.map ===
require("mini.map").setup()
local keyset = vim.keymap.set
local opts = {silent = true, nowait = true}
keyset("n", "<leader>L", ":lua MiniMap.toggle()<CR>", opts)

-- === mini.misc ===
require("mini.misc").setup()

-- === mini.move ===
require("mini.move").setup()

-- === mini.pairs ===
require("mini.pairs").setup({
    mappings = {
        ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
        ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
    }
})

-- === mini.sessions ===
-- require("mini.sessions").setup()

-- === mini.starter ===
-- require("mini.starter").setup()

-- === mini.statusline ===
-- require("mini.statusline").setup()

-- === mini.surround ===
-- require("mini.surround").setup()

-- === mini.tabline ===
-- require("mini.tabline").setup()

-- === mini.test ===
-- require("mini.test").setup()

-- === mini.trailspace ===
-- require("mini.trailspace").setup()

