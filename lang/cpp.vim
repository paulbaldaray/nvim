autocmd FileType cpp call SetLangCPP()
autocmd BufEnter *.cpp call SetLangCPP()
function SetLangCPP()

  set shiftwidth=2 tabstop=2 expandtab

  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = ' -std=c++20'
  let g:syntastic_cpp_include_dirs = ['inc', 'include', 'config', '.']

  noremap <D-b> :!~/.config/nvim/scripts/icpp %:p 
  noremap <D-S-b> :!~/.config/nvim/scripts/irun icpp %:p 
endfunction
