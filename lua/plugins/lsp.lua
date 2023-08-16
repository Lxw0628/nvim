return {
	"neovim/nvim-lspconfig",
	cmd = { "Mason", "Neoconf" },
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
		"folke/neoconf.nvim",
		"folke/neodev.nvim",
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
		},
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		-- 在 https://github.com/williamboman/nvim-lsp-installer#available-lsps 里查看语言对应的Lsp
		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			pyright = {},
			jsonls = {},
			marksman = {},
			volar = {},
			dockerls = {},
			docker_compose_language_service = {},
			bashls = {},
			taplo = {},
			ruff_lsp = {},
		}
		local on_attach = function(_, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("gD", vim.lsp.buf.declaration, "跳转到声明")
			nmap("gd", require("telescope.builtin").lsp_definitions, "跳转到定义")
			nmap("K", "<cmd>Lspsaga hover_doc<CR>", "悬停文档")
			nmap("gi", require("telescope.builtin").lsp_implementations, "跳转到实现")
			nmap("<C-k>", vim.lsp.buf.signature_help, "参数信息")
			nmap(
				"<leader>wa",
				vim.lsp.buf.add_workspace_folder,
				"将路劲处的文件夹添加到工作区文件夹中"
			)
			nmap(
				"<leader>wr",
				vim.lsp.buf.remove_workspace_folder,
				"从工作区文件夹中删除路径处的文件夹"
			)
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "列出工作区文件夹")
			nmap("<leader>D", vim.lsp.buf.type_definition, "跳转到类型定义")
			nmap("<leader>rn", "<cmd>Lspsaga rename ++project<cr>", "重命名")
			nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "选择光标处可用的代码操作")
			nmap("<leader>da", require("telescope.builtin").diagnostics, "错误列表")
			nmap("gr", require("telescope.builtin").lsp_references, "跳转到引用")
			-- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
			-- nmap("<space>fm", function()
			--     vim.lsp.buf.format { async = true }
			-- end, '格式化文件')
			nmap("<space>fm", "<cmd>GuardFmt<CR>", "格式化文件")
		end
		require("neoconf").setup()
		require("neodev").setup()
		require("fidget").setup()
		require("lspsaga").setup()
		require("mason").setup()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						settings = servers[server_name],
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
