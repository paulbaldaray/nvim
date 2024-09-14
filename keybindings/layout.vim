" Split Bindings
noremap <silent> <D-z> :call CreateWindow()<CR>
noremap <silent><D-a> :call ResizeWindow(1)<CR>
noremap <silent> <D-j> <C-w>w
noremap <silent> <D-k> <C-w>W
noremap <silent> <D-l> :call ResizeWindow(0)<CR>
noremap <silent> <D-S-CR> :call SetMainWindow()<CR>
noremap <silent> <D-q> :call CloseWindow()<CR>
noremap <silent> <D-n> za

" Tab Bindings
noremap <silent> <D-T> :call CreateNewTab()<CR>
noremap <D-1> 1gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt

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
