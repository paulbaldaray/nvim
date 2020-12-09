autocmd BufEnter *.l set filetype=lisp
autocmd FileType lisp call SetLangLisp()
function SetLangLisp()

	set shiftwidth=2 tabstop=2 expandtab

	noremap <A-b> :!echo placeholder

endfunction
