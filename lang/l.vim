autocmd BufEnter *.l set SetLangLisp()
function SetLangLisp()

	set shiftwidth=2 tabstop=2 expandtab

	noremap <A-b> :!echo placeholder

endfunction
