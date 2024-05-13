local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'sainnhe/sonokai'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'MunifTanjim/nui.nvim' -- dependency of treesitter
Plug 'xeluxee/competitest.nvim'
vim.call('plug#end')

