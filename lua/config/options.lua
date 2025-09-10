-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Visual
vim.opt.colorcolumn = "80,120"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Misc
vim.opt.timeoutlen = 300
vim.opt.shell = vim.env.SHELL
vim.opt.clipboard = "unnamedplus"

-- Filetypes
vim.filetype.add({
	extension = {
		aiy = "python",
		mdc = "markdown",
		ssql = "sql",
		tmux = "tmux",
		hppm4 = "cpp",
		yapl = "yaml",
	},
})
