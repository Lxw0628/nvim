return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    return require("astrocore").extend_tbl(opts, {
      options = {
        opt = {
          relativenumber = true, -- sets vim.opt.relativenumber
          number = true, -- sets vim.opt.number
          spell = false, -- sets vim.opt.spell
          signcolumn = "yes", -- sets vim.opt.signcolumn to yes
          wrap = false, -- sets vim.opt.wrap
          conceallevel = 2,
          list = false,
          listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
          showbreak = "↪ ",
          spellfile = vim.fn.expand "~/.config/nvim/spell/en.utf-8.add",
          splitkeep = "screen",
          swapfile = false,
          thesaurus = vim.fn.expand "~/.config/nvim/spell/mthesaur.txt",
          -- scrolloff = 5,
        },
        g = {
          -- configure global vim variables (vim.g)
          -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
          -- This can be found in the `lua/lazy_setup.lua` file
        },
      },
    })
  end,
}
