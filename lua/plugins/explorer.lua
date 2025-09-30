return {
	"folke/snacks.nvim",
	build = function()
		require("util.install").ensure_binary({
			name = "fd",
			repo = "sharkdp/fd",
			version = "v10.3.0",
			targets = {
				x86_64 = "x86_64-unknown-linux-musl",
				aarch64 = "aarch64-unknown-linux-musl",
			},
			archive_path = "*/fd",
		})
	end,
	keys = {
		{ "<leader>e", require("util.explorer").git_root, desc = "Explorer (Git Root)" },
		{ "<leader>E", require("util.explorer").parent_dir, desc = "Explorer (Parent Dir)" },
	},
	opts = {
		picker = {
			sources = {
				explorer = {
					layout = {
						hidden = { "input" },
					},
					win = {
						list = {
							keys = {
								["."] = require("util.explorer").cd_to_focused,
								["<BS>"] = require("util.explorer").cd_parent,
								["/"] = function() require("flash").jump() end,
								["i"] = function() require("flash").jump() end,
								["<C-s>"] = require("util.flash").anymode,
							},
						},
					},
				},
			},
		},
	},
}
