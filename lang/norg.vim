autocmd FileType Norg call SetLangNorg()
autocmd BufEnter *.norg call SetLangNorg()
function SetLangNorg()

  set shiftwidth=2 tabstop=2 expandtab
  set wrap linebreak
  set textwidth=60
  set conceallevel=2

endfunction
