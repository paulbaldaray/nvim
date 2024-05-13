local vim = vim

vim.opt.backspace = ''
vim.opt.colorcolumn = '80,120'
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.listchars = 'trail:_,tab:› '
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.background = 'dark'

vim.cmd [[colorscheme sonokai]]
vim.cmd [[highlight MatchParen ctermbg=blue]]
vim.cmd [[highlight Normal ctermbg=None]]

vim.g.syntastic_check_on_open = 1
vim.g.netrw_menu = 0
vim.g.netrw_banner = 0
