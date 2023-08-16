return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.setup({
				enable_check_bracket_line = false,
			})
            -- https://github.com/windwp/nvim-autopairs/wiki/Rules-API
			npairs.add_rules({
				Rule("（", "）"):with_move(cond.done()):set_end_pair_length(1),
				Rule("【", "】"):with_move(cond.done()):set_end_pair_length(1),
				Rule("“", "”"):with_move(cond.done()):set_end_pair_length(1),
			})
		end,
	},
	{
		"ethanholz/nvim-lastplace",
		config = true,
	},
	{
		"ellisonleao/glow.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"folke/flash.nvim",
		keys = {
			{
				"f",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"F",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
		config = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", ":NvimTreeToggle<cr>", desc = "文件树切换", mode = { "n", "v" } },
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
			local opts = { silent = true, nowait = true }
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.basics").setup({
				mappings = {
					-- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
					-- Supply empty string to not create these mappings.
					option_toggle_prefix = "",
					-- Window navigation with <C-hjkl>, resize with <C-arrow>
					windows = true,
				},
			})
			require("mini.bufremove").setup()
			require("mini.comment").setup({
				mappings = {
					-- Toggle comment (like `gcip` - comment inner paragraph) for both
					-- Normal and Visual modes
					comment = "<leader>/",
					-- Toggle comment on current line
					comment_line = "<leader>/",
					-- Define 'comment' textobject (like `dgc` - delete whole comment block)
					textobject = "",
				},
			})
			require("mini.cursorword").setup()
			require("mini.jump").setup({
				mappings = {
					repeat_jump = "",
				},
			})
			require("mini.map").setup()
			local keyset = vim.keymap.set
			local opts = { silent = true, nowait = true }
			keyset("n", "<leader>L", ":lua MiniMap.toggle()<CR>", opts)
			require("mini.misc").setup()
			require("mini.move").setup()
			require("mini.surround").setup()
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		opts = {
			filter_rules = {
				include_current_win = true,
				bo = {
					filetype = { "fidget", "NvimTree" },
				},
			},
		},
		keys = {
			{
				"<c-w>p",
				function()
					local window_number = require("window-picker").pick_window()
					if window_number then
						vim.api.nvim_set_current_win(window_number)
					end
				end,
			},
		},
	},
	{
		"terryma/vim-expand-region",
		keys = {
			{ "v", "<Plug>(expand_region_expand)", { silent = true }, mode = { "v" } },
			{ "V", "<Plug>(expand_region_shrink)", { silent = true }, mode = { "v" } },
		},
		config = function()
			vim.keymap.set("v", "v", "<Plug>(expand_region_expand)", { silent = true })
			vim.keymap.set("v", "V", "<Plug>(expand_region_shrink)", { silent = true })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_browser = "wyeb"
			vim.g.mkdp_markdown_css = "~/.config/nvim/colors/markdown.css"
			vim.g.mkdp_page_title = "${name}"
			vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
			vim.g.mkdp_theme = "dark"
			vim.g.vmt_fence_text = "markdown-toc"
			vim.keymap.set("n", "<F5>", "<Plug>MarkdownPreviewToggle")
		end,
	},
}
