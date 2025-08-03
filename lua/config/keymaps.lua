-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Basics
vim.g.mapleader = " "
vim.keymap.set("i", "fj", "<Esc>")

-- Scroll
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")

vim.keymap.set("n", "<leader>x", ":q<CR>")
-- Quit
vim.keymap.set("n", "<leader>xx", ":q!<CR>")

-- Window
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>")
