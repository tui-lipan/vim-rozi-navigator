set nomore
set runtimepath^=.
let $ROZI = '1'

runtime plugin/rozi_navigator.vim

for [command, mapping] in [
      \ ['RoziNavigateLeft', '<C-h>'],
      \ ['RoziNavigateDown', '<C-j>'],
      \ ['RoziNavigateUp', '<C-k>'],
      \ ['RoziNavigateRight', '<C-l>'],
      \ ['RoziNavigatePrevious', '<C-\>'],
      \ ]
  if exists(':' . command) != 2
    cquit
  endif
  if maparg(mapping, 'n') !~# command
    cquit
  endif
endfor

for [command, mapping] in [
      \ ['RoziNavigateLeft', '<C-h>'],
      \ ['RoziNavigateDown', '<C-j>'],
      \ ['RoziNavigateUp', '<C-k>'],
      \ ['RoziNavigateRight', '<C-l>'],
      \ ]
  if maparg(mapping, 't') !~# command
    cquit
  endif
endfor

if exists(':RoziNavigatorCheck') != 2
  cquit
endif

quitall!
