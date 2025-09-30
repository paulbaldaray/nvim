-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Visual
vim.opt.colorcolumn = "80,120"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Misc
vim.opt.timeoutlen = 200
vim.opt.shell = vim.env.SHELL
vim.opt.clipboard = "unnamedplus"

-- Filetypes
vim.filetype.add({
	extension = {
		mdc = "markdown",
		ssql = "sql",
		tmux = "tmux",
	},
})
