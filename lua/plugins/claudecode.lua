return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = function()
		local focus_key = "<leader>cc"
		local resume_key = "<leader>cr"
		local buffer_key = "<leader>cb"
		local select_key = "<leader>cc"

		vim.keymap.set({ "n", "x" }, focus_key, "<cmd>ClaudeCodeFocus<cr>", { desc = "Claude Focus" })
		vim.keymap.set({ "n", "x" }, resume_key, "<cmd>ClaudeCode --resume<cr>", { desc = "Claude Resume" })
		vim.keymap.set({ "n", "x" }, buffer_key, "<cmd>ClaudeCodeAdd %:p<cr>", { desc = "Claude Buffer" })
		vim.keymap.set("v", select_key, "<cmd>ClaudeCodeSend<cr>", { desc = "Claude Select" })

		require("claudecode").setup({
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
		})
	end,
}
