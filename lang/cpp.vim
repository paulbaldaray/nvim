autocmd FileType cpp call SetLangCPP()
autocmd BufEnter *.cpp call SetLangCPP()
function SetLangCPP()

	set shiftwidth=2 tabstop=2 noexpandtab
	set textwidth=80

	let g:syntastic_cpp_compiler = 'g++'
	let g:syntastic_cpp_compiler_options = ' -std=c++17'
	let g:syntastic_cpp_include_dirs = ['inc', 'include', 'config', '.']
	noremap <A-b> :!icpp % 
	noremap <A-B> :!make && ./bin/*<CR>

endfunction
