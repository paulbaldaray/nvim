return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>gv", require("util.diffview").view, desc = "DiffView", mode = { "n", "v" } },
		{ "<leader>gg", require("util.diffview").history, desc = "DiffHistory", mode = { "n", "v" } },
		{ "<leader>gG", require("util.diffview").history_full, desc = "DiffHistory", mode = { "n", "v" } },
		{ "<leader>gV", require("util.diffview").select, desc = "DiffSelect", mode = { "n", "v" } },
		{ "<leader>go", require("util.diffview").open_commit, desc = "DiffOpen", mode = { "n", "v" } },
		{
			"go",
			require("util.diffview").open_commit_visual,
			desc = "DiffOpen (selection)",
			mode = "v",
		},
		{
			"<leader>gO",
			require("util.diffview").open_commit_history,
			desc = "DiffOpen (history)",
			mode = { "n", "v" },
		},
	},
	opts = {
		enhanced_diff_hl = false,
	},
	config = function(_, opts)
		require("diffview").setup(opts)
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2d4d3a", fg = "#86dc2f" })
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4d2d2d", fg = "#ff4848" })
		vim.api.nvim_set_hl(0, "DiffChange", { bg = "#292b2e", fg = "#ffc777" })
		vim.api.nvim_set_hl(0, "DiffText", { bg = "#5d5d3a", fg = "#ffc777", bold = true })
	end,
}
