-- Basics
vim.g.mapleader = " "
vim.keymap.set('i', 'fj', '<Esc><Esc>')

-- Scroll
vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')

-- Window 
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>s', '<C-w>s')
vim.keymap.set('n', '<leader>v', '<C-w>v')

-- Quit
vim.keymap.set('n', '<leader>x', ':q<CR>')
vim.keymap.set('n', '<leader>xx', ':q!<CR>')

-- Misc
vim.keymap.set('n', '<leader><BS>', ':nohl<CR>')
vim.keymap.set('n', '<leader>r', require('util').run_file_command)
