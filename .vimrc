set encoding=utf8

execute pathogen#infect()

"colorscheme wombat256mod
colorscheme jellybeans
set t_Co=256

"let g:airline_powerline_fonts = 1

let g:airline_theme='molokai'
"let g:airline_theme='powerlineish'

if exists('+colorcolumn')
  execute "set colorcolumn=" . join(range(81,335), ',')
else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

highlight StatusLine ctermfg=12 ctermbg=11 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight StatusLineNC ctermfg=lightgrey ctermbg=lightblue
highlight StatusLine ctermfg=white ctermbg=lightblue
highlight LineNr term=underline cterm=bold ctermfg=3 guifg=Brown
highlight Comment ctermfg=darkcyan

au BufRead,BufNewFile *.{c,cpp,cc,h,sh,pl,pm,html,cgi,java,php,xml,init} set ts=3 sw=3 expandtab nu
au BufRead,BufNewFile *.{py,rb,yml} set ts=4 sw=4 expandtab nu
au BufRead,BufNewFile *.{md,markdown} set textwidth=80 filetype=markdown
au BufRead,BufNewFile *.{ypp,sas} set ts=3 sw=3 expandtab nu filetype=cpp
au BufRead,BufNewFile *.{gcov} set filetype=gcov

set bg=light
highlight ColorColumn ctermbg=black cterm=none

nmap Q <esc>:qa<enter>
nmap H <esc>:noh<enter>

vnoremap < <gv
vnoremap > >gv

set mouse=v
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set scrolloff=10
set shortmess+=I
set fillchars=vert:\│
