autocmd FileType py call SetLangPython()
autocmd BufEnter *.py call SetLangPython()
function SetLangPython()

  set shiftwidth=4 tabstop=4 expandtab

  noremap <D-b> :!python3 %:p 
  noremap <D-S-b> :!~/.config/nvim/scripts/irun ipy %:p 

endfunction
