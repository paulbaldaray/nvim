local focus_key = "<leader>cc"
local resume_key = "<leader>cr"
local buffer_key = "<leader>cb"
local select_key = "<leader>cc"

return {
	"coder/claudecode.nvim",
	lazy = false,
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{ focus_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Focus", mode = { "n", "x" } },
		{ resume_key, "<cmd>ClaudeCode --resume<cr>", desc = "Claude Resume", mode = { "n", "x" } },
		{ buffer_key, "<cmd>ClaudeCodeAdd %:p<cr>", desc = "Claude Buffer", mode = { "n", "x" } },
		{ select_key, "<cmd>ClaudeCodeSend<cr>", desc = "Claude Select", mode = { "v" } },
	},
	opts = {
		terminal_cmd = "claude --dangerously-skip-permissions",
		terminal = {
			---@module "snacks"
			---@type snacks.win.Config|{}
			snacks_win_opts = {
				keys = {
					claude_hide = {
						focus_key,
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
