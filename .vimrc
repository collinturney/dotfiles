" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup        " do not keep a backup file, use versions instead
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

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

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent      " always set autoindenting on

endif " has("autocmd")

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

colorscheme wombat256mod
execute pathogen#infect()
set t_Co=256
"let g:Powerline_symbols = 'fancy'

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
       \ | wincmd p | diffthis

set number
set laststatus=2
set statusline=%<%f\ %y%h%m%r%=%l,%c\ \ \ \ %P\ \ %{strftime('%H:%M')}

if exists('+colorcolumn')
  execute "set colorcolumn=" . join(range(81,335), ',')
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

highlight StatusLine ctermfg=12 ctermbg=11 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight StatusLineNC ctermfg=lightgrey ctermbg=lightblue
highlight StatusLine ctermfg=white ctermbg=lightblue
highlight LineNr term=underline cterm=bold ctermfg=3 guifg=Brown
highlight Comment ctermfg=darkcyan

au BufRead,BufNewFile *.{c,cpp,cc,h,sh,pl,pm,html,cgi,java,php,xml,init} set ts=3 sw=3 expandtab nu
au BufRead,BufNewFile *.{py,rb} set ts=4 sw=4 expandtab nu
au BufRead,BufNewFile *.{md} set textwidth=80 filetype=markdown
au BufRead,BufNewFile *.{ypp,sas} set ts=3 sw=3 expandtab nu filetype=cpp
au BufRead,BufNewFile *.{gcov} set filetype=gcov

nmap Q <esc>:qa<enter>
nmap H <esc>:noh<enter>

"set foldenable
"set foldnestmax=1
"set foldmethod=indent

set bg=light
highlight ColorColumn ctermbg=black cterm=none

vnoremap < <gv
vnoremap > >gv

command -nargs=* Make make <args> | cwindow 50

set mouse+=v
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set scrolloff=5

set shortmess+=I

