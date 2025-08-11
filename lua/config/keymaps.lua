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

-- Yanking

vim.keymap.set("n", "<leader>yP", function()
  local yanked_text = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", yanked_text)
  vim.notify("Yanked: " .. yanked_text, vim.log.levels.INFO)
end, { desc = "Yank absolute path" })

vim.keymap.set("n", "<leader>yp", function()
  local full_path = vim.api.nvim_buf_get_name(0)
  local cwd = vim.fn.getcwd()
  local rel_path = vim.fn.fnamemodify(full_path, ":." .. cwd)
  local line = vim.fn.line(".")
  local yanked_text = rel_path .. ":" .. line
  vim.fn.setreg("+", yanked_text)
  vim.notify("Yanked: " .. yanked_text, vim.log.levels.INFO)
end, { desc = "Yank relative path" })
