" Split Bindings
noremap <silent> <A-t> :call CreateWindow()<CR>
noremap <silent> <A-h> :call ResizeWindow(1)<CR>
noremap <A-j> <C-w>w
noremap <A-k> <C-w>W
noremap <silent> <A-l> :call ResizeWindow(0)<CR>
noremap <silent> <A-CR> :call SetMainWindow()<CR>
noremap <silent> <A-q> :call CloseWindow()<CR>

" Tab Bindings
noremap <silent> <A-T> :call CreateNewTab()<CR>
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt

function CreateWindow()
    if winnr('$') == 1
        vsplit
    else
        exe "normal! \<c-w>b"
        split
    endif
    exe "normal! \<c-w>b :e%:p:h\<cr>"
endfunction

function ResizeWindow(size)
    let s:pwin = winnr()
    if s:pwin != 1
        exe "normal! \<c-w>t"
    endif
    if a:size == 1
        vertical resize -10
    else
        vertical resize +10
    endif
    if s:pwin != 1
        exe "normal! \<c-w>p"
    endif
endfunction

function SetMainWindow()
    if winnr() == 1
        exe "normal! mA \<c-w>p mB \<c-w>t `B \<c-w>p `A \<c-w>t"
    else
        exe "normal! mA \<c-w>t mB \<c-w>p `B \<c-w>t `A"
    endif
endfunction

function CloseWindow()
    quit
    if winnr() == 1
        exe "normal! \<c-w>H"
    endif
endfunction

function CreateNewTab()
    tabedit
    e .
endfunction
