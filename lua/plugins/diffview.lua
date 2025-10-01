return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>gv", require("util.diffview").view, desc = "DiffView", mode = { "n", "v" } },
		{ "<leader>gg", require("util.diffview").history, desc = "DiffHistory", mode = { "n", "v" } },
		{ "<leader>gV", require("util.diffview").select, desc = "DiffSelect", mode = { "n", "v" } },
	},
	opts = {
		enhanced_diff_hl = true,
	},
}
