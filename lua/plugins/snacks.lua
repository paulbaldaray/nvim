return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		scratch = {
			ft = "markdown",
		},
	},
	keys = {
		{
			"<leader>'",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			'<leader>"',
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
	},
}
