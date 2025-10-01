return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>gv", require("util.diffview").toggle, desc = "Toggle Diffview" },
		{ "<leader>gg", require("util.diffview").history, desc = "Toggle File History" },
		{ "<leader>gV", require("util.diffview").compare, desc = "Toggle Diffview with..." },
	},
	opts = {
		enhanced_diff_hl = true,
	},
}
