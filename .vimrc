" Vim configuration file

" DEFAULT OPTIONS
set nocompatible
set path=.,,/usr/share/vim/vim63/syntax/syntax.vim,/usr/share/vim/current/syntax/syntax.vim,~/.vim
set encoding=utf-8

set ts=4
set sw=4
set sts=4
set expandtab
:set modeline 				" use settings from file being edited
set modeline

" DISPLAY OPTIONS
if has("gui_running")
     if has("gui_gtk2")
         set guifont=Inconsolata\ 13
     elseif has("x11")
		 " set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
         set guifont=Inconsolata\ 13
     else
         "set guifont=Courier_New:h11:cDEFAULT
		 set guifont=Inconsolata\ 13
     endif
else
    " Try to get the correct main terminal type
    if &term =~ "xterm"
	let myterm = "xterm"
    elseif &term =~ "screen"
	let myterm = "screen"
    else
	let myterm =  &term
    endif
    let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
    let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
    let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
    let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
    let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")
    
    " I put a lot of the vim terminal hackery in its own file because it was annoying me
    :so ~/.vimterm
endif

set background=dark
colorscheme koehler
set number
set ruler
set backspace=indent,eol,start		" backspaces can go over lines
:if version >= 600
  set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<
:elseif version >= 500
  set listchars=eol:$,tab:>-,trail:-,extends:+
:endif
set laststatus=2
set showmode
set shortmess=lnrxI			" brief messages, don't show intro
set showcmd
set more
set showmatch
highlight XXX cterm=underline
syntax on

" SAVING OPTIONS
set backupext=~

" EDITING OPTIONS
set nowrap
set cindent
set autoindent
set noerrorbells visualbell
set esckeys				" allow arrow keys in insert mode
syntax enable
filetype plugin indent on
" Turn off autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" SEARCH OPTIONS
set nohlsearch
set incsearch
set ignorecase
set smartcase

" MISCELLANEOUS OPTIONS
set dictionary=/usr/share/dict/words
set magic				" regexp chars have special meaning
set tags=tags,\ .tree_top/tags,\ .tree_top/prod/build/tags,\ .tree_top/prod/tags
set autowrite
set clipboard=unnamed

let g:netrw_winsize=25
let g:netrw_alto=1

autocmd BufEnter * let &titlestring = expand("%:t:~") . ' @ ' . $HOSTNAME
set title

" This 1970s text editor can't understand modern keyboards. Yay.
map <Esc>OH <Home>
map <Esc>OF <End>
map <Esc>[H <Home>
map <Esc>[F <End>
imap <Esc>OH <Home>
imap <Esc>OF <End>
imap <Esc>[H <Home>
imap <Esc>[F <End>

map <F8> <Esc>:tabnew<CR>
imap <F8> <Esc>:tabnew<CR>
map <F9> <Esc>:Vexplore<CR> 

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" save shortcut
map <C-S> <Esc>:w<CR>
map! <C-S> <Esc>:w<CR>
imap <C-S> <Esc>:w<CR>i


