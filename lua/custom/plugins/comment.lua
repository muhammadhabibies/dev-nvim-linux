return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	opts = {
		enable_autocmd = false,
	},
	config = function(_, opts)
		-- 1. Jalankan setup bawaan plugin
		require("ts_context_commentstring").setup(opts)

		-- 2. Integrasikan dengan fitur komentar native Neovim
		local get_option = vim.filetype.get_option
		vim.filetype.get_option = function(filetype, option)
			if option == "commentstring" then
				return require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
			return get_option(filetype, option)
		end
	end,
}
