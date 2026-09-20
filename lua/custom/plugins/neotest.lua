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
		-- { "<leader>tr", "<cmd>Neotest run<cr>" },
		-- { "<leader>to", "<cmd>Neotest output<cr>" },
		-- { "<leader>ts", "<cmd>Neotest summary<cr>" },
		-- { "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{ "<leader>to", "<cmd>Neotest output<cr>", desc = "Test output" },
		{ "<leader>ts", "<cmd>Neotest summary<cr>", desc = "Test summary" },
		{
			"<leader>ta",
			function()
				require("neotest").run.run({ suite = true })
			end,
			desc = "Run test suite",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-pest")({
					pest_cmd = function()
						return "vendor/bin/pest"
					end,
				}),
				require("neotest-vitest"),
				require("neotest-jest"),
				require("neotest-phpunit"),
			},
		})
	end,
}
