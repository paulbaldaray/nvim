autocmd FileType svelte call SetLangSvelte()
autocmd BufEnter *.svelte call SetLangSvelte()
function SetLangSvelte()

	set shiftwidth=4 tabstop=4 noexpandtab
	set textwidth=80

    noremap <A-o> :!google-chrome-stable --new-window --incognito http://localhost:5000 &<CR>
    noremap <A-b> :!npm run dev > /dev/null &<CR>

endfunction
