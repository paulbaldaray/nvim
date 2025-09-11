return {
	{ "catppuccin/nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	require("catppuccin").setup({
		auto_integrations = true,
	}),
}
