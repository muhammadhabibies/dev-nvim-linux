return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ts_ls",
				"vue_ls",
				"html",
				"cssls",
				"tailwindcss",
				"graphql",
				"emmet_ls",
				"prismals",
				"eslint",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			-- Path otomatis ke typescript-plugin milik Volar/Vue di folder Mason
			local vue_plugin_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

			-- 1. Setup ts_ls dengan plugin Vue
			vim.lsp.config("ts_ls", {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_plugin_path,
							languages = { "vue" },
						},
					},
				},
			})

			-- 2. Setup vue_ls
			vim.lsp.config("vue_ls", {
				filetypes = { "vue" },
			})

			-- Aktifkan kedua server
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("vue_ls")

			-- PAKSA ts_ls attach ke file .vue agar error "Could not find ts_ls" hilang
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "vue",
				callback = function(args)
					vim.lsp.start({
						name = "ts_ls",
						cmd = { "typescript-language-server", "--stdio" },
						root_dir = vim.fs.root(args.buf, { "package.json", "tsconfig.json", "jsconfig.json" }),
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_plugin_path,
									languages = { "vue" },
								},
							},
						},
					})
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"eslint_d",
				"stylua",
				-- "isort",
				-- "black",
				-- "pylint",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
