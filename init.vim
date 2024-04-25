call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'xeluxee/competitest.nvim'
call plug#end()

set backspace=1
set colorcolumn=80
set laststatus=0
set number relativenumber
set shiftwidth=2 tabstop=2 expandtab
set textwidth=0 wrapmargin=0
set autoindent smarttab
set nohlsearch incsearch ignorecase smartcase
set list listchars=trail:_,tab:›\ 
set clipboard+=unnamedplus
let g:python_highlight_all = 1

syntax on
colorscheme sonokai
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

noremap <A-b> :!%
let g:syntastic_check_on_open = 1
let g:netrw_menu = 0
let g:netrw_banner = 0
call SourceDirectory("~/.config/nvim/lang")
call SourceDirectory("~/.config/nvim/keybindings")
autocmd BufEnter * call SourceLocal()

lua << TREESITTER
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "zsh", "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
TREESITTER
