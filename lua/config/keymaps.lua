-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Basics
vim.g.mapleader = " "
vim.keymap.set("i", "fj", "<Esc>")

-- Scroll
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")

-- Quit
vim.keymap.set("n", "<leader>x", ":q<CR>")
vim.keymap.set("n", "<leader>xx", ":q!<CR>")

-- Window
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>")

-- Unmap the "Move Lines" bindings
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")

-- Yanking

function GitRoot()
	local dir = vim.fn.expand("%:p:h")
	return vim.fn.systemlist("git -C " .. dir .. " rev-parse --show-toplevel")[1]
end

vim.keymap.set("n", "<leader>yp", function()
	local full_path = vim.api.nvim_buf_get_name(0)
	local git_root = GitRoot()
	if git_root ~= "" then
		local rel_path = vim.fn.fnamemodify(full_path, ":." .. git_root)
		vim.fn.setreg("+", rel_path)
		vim.notify("Yanked: " .. rel_path, vim.log.levels.INFO)
	else
		vim.notify("Not in a Git repository.", vim.log.levels.WARN)
	end
end, { desc = "Yank relative path from Git root" })

vim.keymap.set("n", "<leader>yP", function()
	local yanked_text = vim.fn.expand("%:p")
	vim.fn.setreg("+", yanked_text)
	vim.notify("Yanked: " .. yanked_text, vim.log.levels.INFO)
end, { desc = "Yank absolute path" })
