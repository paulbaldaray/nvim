return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		scratch = {
			win = {
				width = 0.7,
				height = 0.7,
				zindex = 1000,
			},
		},
	},
	keys = {
		{
			"<leader>'",
			require("util.scratch").toggle,
			desc = "Toggle Scratch Buffer",
			mode = { "n", "x" },
		},
		{
			'<leader>"',
			require("util.scratch").menu,
			desc = "Scratch Buffer Menu",
			mode = { "n", "x" },
		},
		{
			"<leader>c'",
			require("util.claude-scratch").toggle,
			desc = "Toggle Claude Scratch Buffer",
			mode = { "n", "x" },
		},
		{
			'<leader>c"',
			require("util.claude-scratch").menu,
			desc = "Claude Scratch Buffer Menu",
			mode = { "n", "x" },
		},
	},
}
