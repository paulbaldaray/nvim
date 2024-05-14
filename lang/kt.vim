autocmd FileType kt call SetLangKT()
autocmd BufEnter *.kt call SetLangKT()
function SetLangKT()

  set shiftwidth=2 tabstop=2 expandtab

  noremap <A-b> :!~/.config/nvim/scripts/ikt % 
  noremap <A-S-b> :!echo '' \| ikt %<Left><Left><Left><Left><Left><Left><Left><Left><Left>
endfunction
