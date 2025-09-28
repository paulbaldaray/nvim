local toggle_key = "<leader>cc"
local resume_key = "<leader>cr"
local send_key = "<leader>cs"

return {
	"coder/claudecode.nvim",
	lazy = false,
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Focus", mode = { "n", "x" } },
		{ resume_key, "<cmd>ClaudeCode --resume<cr>", desc = "Resume", mode = { "n", "x" } },
		{ send_key, "<cmd>ClaudeCodeAdd %<cr>", desc = "Send Buffer", mode = { "n", "x" } },
		{ send_key, "<cmd>ClaudeCodeSend<cr>", desc = "Send Select", mode = "v" },
	},
	opts = {
		terminal_cmd = "claude --dangerously-skip-permissions",
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
}
