return {
	"folke/snacks.nvim",
	keys = {
		{ "<leader>e", require("util.explorer").git_root, desc = "Explorer (Git Root)" },
		{ "<leader>E", require("util.explorer").parent_dir, desc = "Explorer (Parent Dir)" },
	},
	opts = {
		picker = {
			sources = {
				explorer = {
					layout = {
						auto_hide = { "input" },
					},
					win = {
						input = {
							keys = {
								["<Esc>"] = false,
								["/"] = { "toggle_focus", mode = { "i", "n" } },
							},
						},
						list = {
							keys = {
								["."] = require("util.explorer").cd_to_focused,
								["<BS>"] = require("util.explorer").cd_parent,
								["<C-s>"] = require("util.flash").anymode,
								["<Esc>"] = false,
							},
						},
					},
				},
			},
		},
	},
}
