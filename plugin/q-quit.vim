" q-quit.txt - q to smart quit.
" Maintainer:   HustLion
" Version:      1.0

if exists("g:loaded_q_quit") || v:version < 700 || &cp
  finish
endif
let g:loaded_q_quit = 1

set ttimeout
if &ttimeoutlen == -1
  set ttimeoutlen=50
endif

" let g:q_quit_ignore_window_names = []
" let g:q_quit_ignore_filetypes = []
" let g:q_quit_close_when_only_one_window = 1

fu! s:SmartClose() abort
  let ignorewin = get(g:, 'q_quit_ignore_window_names', [])
  let ignoreft = get(g:, 'q_quit_ignore_filetypes', [])
  let win_count = winnr('$')
  let num = win_count
  for i in range(1, win_count)
    if index(ignorewin, bufname(winbufnr(i))) != -1 || index(ignoreft, getbufvar(bufname(winbufnr(i)), '&filetype')) != -1
      let num = num - 1
    endif
    if getbufvar(winbufnr(i), '&buftype') ==# 'quickfix'
      let num = num - 1
    endif
  endfor
  if num == 1
    if exists('g:q_quit_close_when_only_one_window') && g:q_quit_close_when_only_one_window == 1
      quit
    else
      echom "Last window, not closing. (See *q-quit* options to enable closing last window.)"
    endif
  else
    quit
  endif
endf


" native q for macro recording remapped.
nnoremap <silent> <leader>q q

nnoremap <silent> q :<C-u>call <SID>SmartClose()<cr>

" vim:set et sw=2: