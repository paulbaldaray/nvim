let g:tex_flavor = "latex"
autocmd FileType tex call SetLangTex()
autocmd BufEnter *.tex call SetLangTex()

function SetLangTex()

	set shiftwidth=2 tabstop=2 expandtab

	let g:syntastic_tex_checkers = []

	noremap <silent> <buffer> <A-b> :call CompileLatex() <CR>
	noremap <silent> <buffer> <A-o> :!open %:p:h:h/bin/%:t:r.pdf <CR>

endfunction

function CompileLatex()
	!pdflatex -output-directory %:p:h:h/aux %:p
	!mv %:p:h:h/aux/%:t:r.pdf %:p:h:h/bin/%:t:r.pdf
endfunction
