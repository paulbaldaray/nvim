autocmd FileType kt call SetLangKT()
autocmd BufEnter *.kt call SetLangKT()
function SetLangKT()

  set shiftwidth=2 tabstop=2 expandtab

  noremap <D-b> :!~/.config/nvim/scripts/ikt %:p 
  noremap <D-S-b> :!~/.config/nvim/scripts/irun ikt %:p 
endfunction
