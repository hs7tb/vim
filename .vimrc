
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
 " autocmd BufReadPost *
 "   \ if line("'\"") > 1 && line("'\"") <= line("$") |
 "   \   exe "normal! g`\"" |
 "   \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('mouse')
  set mouse=a
endif

if has('gui_running')
    colorscheme evening 
else
    colorscheme koehler
endif

set ts=4
set sw=4
set expandtab

"Display line number
set number

"fonts
set guifont=Monaco 
set encoding=UTF-8
set fenc=utf-8
set fencs=utf-8,chinese,ucs-bom,gb18030,gbk,gb2312,cp936

"autoread files that are editted by other apps
set autoread

"window navigation
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
autocmd FileType cpp setlocal sw=2 ts=2 sts=2

let mapleader = ","

"set path to chromium directory
set path+=~/chromium-v28-1500/Cloud9NativeChromiumBuild/src/content/**
set path+=~/chromium-v28-1500/Cloud9NativeChromiumBuild/src/amazon/**
set path+=~/chromium-v28-1500/Cloud9NativeChromiumBuild/src/net/**
set path+=~/cloud9/src/**

"shorten tabnew becaue I am lazy
cmap tn tabnew

"set cscope to display result in quickfix window
set cscopequickfix=s-,c-,d-,i-,t-,e-
"add some cscope db
cs add ~/cloud9/src/cscope.out
cs add ~/chromium-v28-1500/Cloud9NativeChromiumBuild/src/cscope.out

"automatically read the file when it is changed
set autoread

""
nmap <leader>t :TlistToggle<cr>
