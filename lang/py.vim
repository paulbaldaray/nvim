autocmd FileType python call SetLangPython()
function SetLangPython()

	set shiftwidth=2 tabstop=2 expandtab
	set textwidth=80
	let g:syntastic_python_python_exec = 'python3'
	let g:syntastic_python_checkers = ['python']
	noremap <A-b> :!python3 % 

endfunction
