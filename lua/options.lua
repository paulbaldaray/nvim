-- Spaces not tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Visual
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80,120'

-- Clipboard
vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy '+',
    ['*'] = require('vim.ui.clipboard.osc52').copy '*',
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste '+',
    ['*'] = require('vim.ui.clipboard.osc52').paste '*',
  }
}

-- Misc
vim.opt.timeoutlen=300
