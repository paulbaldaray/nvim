-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Basics
vim.g.mapleader = " "

-- Scroll
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")

-- Window
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>")

-- Clear
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>", { desc = "Clear search highlighting" })

-- Yank
vim.keymap.set("n", "<leader>yp", require("util.path").copy_git_relative_path, { desc = "Yank relative path" })
vim.keymap.set("n", "<leader>yP", require("util.path").copy_git_relative_line, { desc = "Yank relative line" })
vim.keymap.set("n", "<leader>ya", require("util.path").copy_absolute_path, { desc = "Yank absolute path" })
vim.keymap.set("n", "<leader>yA", require("util.path").copy_absolute_line, { desc = "Yank absolute line" })
vim.keymap.set("n", "<leader>yd", require("util.path").copy_absolute_directory, { desc = "Yank absolute directory" })

-- Navigate
vim.keymap.set("n", "<leader><leader>", require("util.path").navigate, { desc = "Navigate to file or directory" })

-- Jump
vim.keymap.set(
	{ "n", "v", "i", "x", "o", "t", "c", "s" },
	"<C-s>",
	require("util.flash").anymode,
	{ desc = "Flash jump from any mode" }
)

-- Unmap
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
