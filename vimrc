""""""""""""""""""""""""""""""""""""""""
"
"             for macbook
"
""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ia xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"      Cope
"      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
" can be used with vimgrep or anything in quickfix
map ,cc :botright cope<cr>
map ,cn :cn<cr>
map ,cp :cp<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""
map ,pp :setlocal paste!<cr>
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          Spell checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map ,ss :setlocal spell!<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""
"
"             note-taking
"
""""""""""""""""""""""""""""""""""""""""
" with Vim helptags and git, store things 
" $VIMRUNTIME/doc
" NOTE: NO ":" in the following line, stange but works
autocmd FileType help set ma 
autocmd FileType help set noreadonly
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc

""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""
" in order to switch between buffers
" with unsaved change 
set hidden
noremap ,bn :bn<CR>
noremap ,bd :bd<cr>
autocmd! bufwritepost vimrc source ~/.vim/vimrc
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""
"
"        tablist 
"
"""""""""""""""""""""""""""""""""""""
map pwd :pwd<cr>
map ,e :tabnew 
map <C-h> :tabp<cr>
map <C-l> :tabn<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             formatting 
"
""""""""""""""""""""""""""""""""""""""""
" this is for C comments, see *fo-table* to know what althese options mean
set fo=croq

""""""""""""""""""""""""""""""""""""""""
"
"             Doxygen
"
""""""""""""""""""""""""""""""""""""""""
" highlight the doxygen comments
" used with DoxygenToolkit.vim
let g:load_doxygen_syntax=1

""""""""""""""""""""""""""""""""""""""""
"
"             NERDtree
"
""""""""""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>
"map ,n :NERDTreeMirror<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             quit quickly
"
""""""""""""""""""""""""""""""""""""""""
" before I use <S-ZZ> to quit, this has the danger of unexpectedly
" save some garbage editing, so I have a safer way now as below
map ,, :q!<CR>
map <tab> :w!<CR>

"""""""""""""""""""""""""""""""""""""""""
"
"           match racket
"
"""""""""""""""""""""""""""""""""""""""""
map t %

"""""""""""""""""""""""""""""""""""""""""
"
"           match keyword
"
"""""""""""""""""""""""""""""""""""""""""
nmap ff g*N

"""""""""""""""""""""""""""""""""""""""""
"
"           grep keyword
"
"""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = '.git CVS SCCS .svn generated .hg'
set grepprg=/usr/bin/grep\ -nrHI\
"nmap ,f :grep "<c-r>=expand("<cword>")<cr>" *<cr>
function! MyGrep(grepstr)
  execute "silent! grep " a:grepstr "*"
  botright copen
  exec "redraw!"
endfunction

function! GrepCurrentWord()
    let currWord=expand("<cword>")    
    if empty(currWord)
      echohl "not current word"
    endif
    call MyGrep(currWord)
endfunction

nmap ,f :call GrepCurrentWord()<cr> <c-w>T :tabmove 0<cr>
nmap ,t <c-w>gF

"""""""""""""""""""""""""""""""""""""""""""""
"
"             vimrc editing 
"
""""""""""""""""""""""""""""""""""""""""
" I need a fake ~/.vimrc: runtime vimrc
" http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
map ,v :tabnew ~/.vim/vimrc<CR>
" When vimrc is edited, reload it
" copied from http://amix.dk/vim/vimrc.html

""""""""""""""""""""""""""""""""""""""""
"
"            quick escape  
"
""""""""""""""""""""""""""""""""""""""""
" set quick escape from insert mode, and now I can go without arrow keys and
" use j and k to move around in insert mode
imap JJ <esc>
imap jj <esc>

""""""""""""""""""""""""""""""""""""""""
"
"    wildmode/cmdline-completion
"
""""""""""""""""""""""""""""""""""""""""
set wildmenu

""""""""""""""""""""""""""""""""""""""""
"
"             tabbing 
"
""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""""""""""""""""""
"
"             dictionary
"
""""""""""""""""""""""""""""""""""""""
" i_CTRL_X_K 
set dictionary+=~/.vim/dict/simple
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

""""""""""""""""""""""""""""""""""""""""
"
"             Search
"
""""""""""""""""""""""""""""""""""""""""
" ic also has effect on dictionary settings
set ic 
set hlsearch
"set incsearch

""""""""""""""""""""""""""""""""""""""""
"
"             status line
"
""""""""""""""""""""""""""""""""""""""""
" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][1x%B]\ %=nianian
"set tal=%T\ %X

" tell VIM to always put a status line in, even if there is only one window
" this means I can also see what is the filename I am in, finally!
set laststatus=2

""""""""""""""""""""""""""""""""""""""""
"
"             misc
"
""""""""""""""""""""""""""""""""""""""""
" Do not know how to use autocmd yet, so the following line not working
" autocmd FileType text setlocal textwidth=78
set textwidth=78

" set number for doing diffs and folding
set showcmd
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
" set scrolloff=8

"""""""""""""""""""""""""""""""""""""""""""""""
" 
"Allow the cursor to go in to "invalid" places
"
"""""""""""""""""""""""""""""""""""""""""""""""
"set virtualedit=all

" get rid of the silly characters in window separators
set fillchars=""

" Highlight all instances of the current word under the cursor
" nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>
" cd to the directory containing the file in the buffer
"
"nmap <silent> ,cd :lcd %:h<CR> "local cd for a window
nmap <silent> ,cd :cd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

"""""""""""""""""""""""""""""""""""""""
"
"             gcc
"
"""""""""""""""""""""""""""""""""""""""
set makeprg=gcc\ %:p\ -o\ %:p:r\ -g

""""""""""""""""""""""""""""""""""""""
"
"            cscope && ctags
"
"""""""""""""""""""""""""""""""""""""
function! s:LiteTabMove(idx)
	let index = tabpagenr() + a:idx
	if (index < 0)
		return
	endif
    silent execute 'tabmove ' . index
endfunction

":nmap ,t :!(cd %:p:h;ctags *)&
"map <C-/> :tab split<CR>:exec("cs find c ".expand("<cword>"))<CR>
map <C-k> :tab split<CR>:call <SID>LiteTabMove(-2)<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-j> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-u> :vsp <CR>:exec("cs find c ".expand("<cword>"))<CR>
:set tags=tags;

""""""""""""""""""""""""""""""""""""
"
"       colorscheme 
"       
""""""""""""""""""""""""""""""""""""
"colorscheme elise
colorscheme default
"set t_Co=256
"

"""""""""""""""""""""""""""""""""""
"
"       set line cus, cuc
"
"""""""""""""""""""""""""""""""""""
"set cursorline
"set cuc

"""""""""""""""""""""""""""""""""""
"
"        set no .swp file 
"
"""""""""""""""""""""""""""""""""""
set noswapfile

"""""""""""""""""""""""""""""""
"
"  sudo save
"
"""""""""""""""""""""""""""""""
nmap ,sw :silent! w !sudo tee %<cr>

"""""""""""""""""""""""""""""""""""
"
"       set clipborad unnamed
"       should have +clipboard
"
"""""""""""""""""""""""""""""""""""
set clipboard=unnamed 

"""""""""""""""""""""""""""""""
"
"       google clipborad
"
"""""""""""""""""""""""""""""""
"1st version 
"nmap ,g :!open 'http://google.com/search?q=<c-r>=getreg('*')<cr>' <cr>
nmap ,d :!open 'http://baidu.com/s?wd=<c-r>=getreg('*')<cr>' <cr>
"2nd version silent it
function! GoogleIt()
    let cliptext=getreg('*')
    " '.' is string combine operator
    let command="silent !open -b com.google.Chrome http://google.com/search?q=".cliptext
    execute command
    execute "redraw!"
endfunction

nmap ,g :call GoogleIt()<cr>

"""""""""""""""""""""""""""""""
"
"       汉语乱码问题
"
"""""""""""""""""""""""""""""""
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
