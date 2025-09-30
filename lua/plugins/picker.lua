return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			win = {
				input = {
					keys = {
						["<C-s>"] = require('util.flash').anymode,
					},
				},
			},
		},
	},
}
