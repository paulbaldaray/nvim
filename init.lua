local vim = vim

require('plugins')
require('treesitter-config')
require('options')

vim.api.nvim_exec([[
  function SourceLocal()
    if filereadable(".nvimrc")
      source .nvimrc
    elseif filereadable(".exrc")
      source .exrc
    endif
  endfunction

  function! SourceDirectory(file)
    for s:fpath in split(globpath(a:file, '*.vim'), '\n')
      exe 'source' s:fpath
    endfor
  endfunction

  noremap <A-b> :!%

  autocmd BufEnter * call SourceLocal()
]], true)

vim.call('SourceDirectory', '~/.config/nvim/lang')
vim.call('SourceDirectory', '~/.config/nvim/keybindings')

