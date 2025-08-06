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

-- Directory Management
vim.keymap.set("n", "<leader>.", "<cmd>cd %:p:h<CR>", { desc = "Change CWD to current file directory" })

-- Get current filename and path
vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p") .. ":" .. vim.fn.line("."))
end, { desc = "Yank file path and line number to clipboard" })
