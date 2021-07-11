autocmd BufEnter *.sqlpp set filetype=sql
autocmd FileType sql call SetLangSQL()
autocmd BufEnter *.sql call SetLangSQL()
function SetLangSQL()

	set ts=4 sw=4 expandtab
	noremap <A-b> :!./test %<CR>

endfunction
