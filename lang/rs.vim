autocmd FileType rust call SetLangRust()
autocmd BufEnter *.rs call SetLangRust()
function SetLangRust()

	set shiftwidth=4 tabstop=4 expandtab

	noremap <A-b> :!irs % 

endfunction
