local toggle_key = "<leader>cc"
return {
	{
		"coder/claudecode.nvim",
		lazy = false,
		dependencies = { "folke/snacks.nvim" },
		keys = {
			{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
			{ toggle_key, "<cmd>ClaudeCodeSend<cr>", desc = "Claude Send Select", mode = "v" },
		},
		opts = {
			terminal = {
				---@module "snacks"
				---@type snacks.win.Config|{}
				snacks_win_opts = {
					keys = {
						claude_hide = {
							toggle_key,
							function(self)
								self:hide()
							end,
							mode = "t",
							desc = "Hide",
						},
					},
				},
			},
		},
	},
}
