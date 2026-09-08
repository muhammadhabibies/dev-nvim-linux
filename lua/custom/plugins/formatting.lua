return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		---@diagnostic disable-next-line: param-type-mismatch
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				liquid = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = function(bufnr)
				-- buat file .nvim.lua di project yang mau disable format on save dan isikan:
				-- -- disable format-on-save conform this project only
				-- vim.b.disable_autoformat = true
				-- vim.g.disable_autoformat = true

				-- cek apakah autoformat dimatikan secara global (vim.g) atau khusus buffer (vim.b)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 3000,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
