autocmd FileType rust call SetLangRust()
function SetLangRust()

	set shiftwidth=4 tabstop=4 expandtab
	set textwidth=80

	noremap <silent> <A-b> :!cargo build <CR>
	noremap <silent> <A-x> :!cargo run <CR>

endfunction
