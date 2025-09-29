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
local util = require("config.util")

vim.keymap.set("n", "<leader>yp", util.CopyGitRelativePath, { desc = "Yank relative path from Git root" })

vim.keymap.set("n", "<leader>yP", util.CopyAbsolutePath, { desc = "Yank absolute path" })
