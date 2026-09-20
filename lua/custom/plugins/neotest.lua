return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",

		"V13Axel/neotest-pest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
		"olimorris/neotest-phpunit",
	},
	keys = {
		{ "<leader>tr", "<cmd>Neotest run<cr>" },
		{ "<leader>to", "<cmd>Neotest output<cr>" },
		{ "<leader>ts", "<cmd>Neotest summary<cr>" },
		{ "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-pest"),
				require("neotest-vitest"),
				require("nvim-neotest/neotest-jest"),
				require("neotest-phpunit"),
			},
		})
	end,
}
