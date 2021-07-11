call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
call plug#end()

set backspace=1
set laststatus=0
set number relativenumber
set shiftwidth=4 tabstop=4 expandtab
set autoindent smarttab
set nohlsearch incsearch ignorecase smartcase
set list listchars=trail:_,tab:›\ 
set clipboard+=unnamedplus

syntax on
colorscheme gruvbox
set background=dark
highlight MatchParen ctermbg=blue
highlight Normal ctermbg=None

function SourceLocal()
	if filereadable(".nvimrc")
		source .nvimrc
	elseif filereadable(".exrc")
		source .exrc
	endif
endfunction

function! SourceDirectory(file)
	for s:fpath in split(globpath(a:file, '*.vim'), '\n')
		exe 'source' s:fpath
	endfor
endfunction

let g:syntastic_check_on_open = 1
let g:netrw_menu = 0
let g:netrw_banner = 0
call SourceDirectory("~/.config/nvim/lang")
call SourceDirectory("~/.config/nvim/keybindings")
autocmd BufEnter * call SourceLocal()
