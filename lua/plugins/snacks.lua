local scratch_file = vim.fn.stdpath("data") .. "/scratch.md"

return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		scratch = {
			ft = "markdown",
			file = scratch_file,
		},
	},
	keys = {
		{
			"<leader>'",
			function()
				if vim.fn.expand("%:p") == scratch_file then
					vim.cmd("close")
				else
					Snacks.scratch()
				end
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
