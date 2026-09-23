return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",

		"V13Axel/neotest-pest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
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
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run the current file",
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
				require("neotest-pest"),
				require("neotest-vitest"),
				require("neotest-jest"),
			},
		})
	end,
}
