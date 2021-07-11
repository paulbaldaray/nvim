autocmd FileType c call SetLangC()
autocmd BufEnter *.c call SetLangC()
function SetLangC()

	set shiftwidth=4 tabstop=4 noexpandtab
	set textwidth=80

	let g:syntastic_c_compiler = 'gcc'
	let g:syntastic_c_compiler_options = '-Wall -pedantic'
	let g:syntastic_c_include_dirs = ['inc', 'include', 'config', '.']
	noremap <A-b> :!interpc %
	noremap <A-B> :!make<CR> :!./bin/*

endfunction
