autocmd FileType sql call SetLangSQL()
function SetLangSQL()

	set ts=4 sw=4 expandtab
	noremap <A-b> :!./test %<CR>

endfunction
