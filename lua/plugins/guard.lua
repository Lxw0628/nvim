return {
	"nvimdev/guard.nvim",
	event = "VeryLazy",
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("lsp"):append("stylua")
		ft("python"):fmt("black"):append("isort")
		ft("json"):fmt("jq")
		ft("sh"):fmt("shfmt")
		ft("html"):fmt({
			cmd = "prettier",
			args = { "--stdin-filepath", "--tab-width", "4" },
			stdin = true,
			fname = true,
		})
		ft("css,sass,scss,less"):fmt("lsp"):append({
            cmd = "prettier",
			args = { "--stdin-filepath", "--tab-width", "4" },
			stdin = true,
			fname = true,
        })
		ft("javascript,typescript"):fmt({
            cmd = "prettier",
			args = { "--stdin-filepath", "--tab-width", "4" },
			stdin = true,
			fname = true,
        })

		ft("markdown"):fmt("cbfmt")

		require("guard").setup({
			fmt_on_save = false,
			lsp_as_default_formatter = true,
		})
	end,
}
