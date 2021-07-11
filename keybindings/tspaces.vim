noremap <A-m> :call AlternateTabsAndSpaces()<CR>

" From the VIM Wiki for leading Tabs and Spaces
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

function AlternateTabsAndSpaces()
    normal mp
	set expandtab!
	if &expandtab
		echo 'Spaces'
		silent! Tab2Space
	else
		echo 'Tabs'
		silent! Space2Tab
	endif
    normal `p
endfunction
