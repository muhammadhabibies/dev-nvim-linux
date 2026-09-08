return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
			-- highlight_groups = {
			-- 	Normal = { bg = "#000000" }, -- main background
			-- 	NormalNC = { bg = "#000000" }, -- background jendela yang tidak aktif (Non-Current)
			-- 	NormalFloat = { bg = "#000000" }, -- floating window (kek lsp hover)
			-- },
		})

		vim.cmd("colorscheme rose-pine-moon")
	end,
}
