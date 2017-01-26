" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

if exists("syntax_on")
  syntax reset
endif

"StatusLine stl
"hi StatusLine ctermbg=Blue ctermfg=red cterm=NONE guibg=Gray20 guifg=#ffcc66 gui=none
"hi StatusLineNC ctermbg=blue ctermfg=none cterm=NONE guibg=Gray20 guifg=#ffcc66 gui=none

" TabLine
"hi TabLine ctermbg=white ctermfg=black cterm=NONE guibg=Gray20 guifg=#ffcc66 gui=none
"hi TabLineFill ctermbg=white ctermfg=black cterm=NONE guibg=Gray20 guifg=#ffcc66 gui=none
hi TabLineSel ctermbg=none ctermfg=red cterm=bold 
"guibg=#ffcc66 guifg=Gray20 gui=bold

" Load the syntax highlighting defaults, if it's enabled.
let colors_name = "default"

" vim: sw=2
