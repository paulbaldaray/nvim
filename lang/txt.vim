autocmd FileType text call SetLangText()
autocmd BufEnter *.txt call SetLangText()
function SetLangText()

	set shiftwidth=2 tabstop=2 expandtab
	set textwidth=80

endfunction
