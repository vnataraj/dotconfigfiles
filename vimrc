set nocompatible
call pathogen#infect()
"airline stuff
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"ctrlp stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"clipboard stuff
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> *
map Q gq
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set cindent
set background=dark
set number
syntax enable
colorscheme jellybeans
set backspace=2 shiftwidth=2
set expandtab
set t_Co=256
set ignorecase
set foldenable
set cursorline
set foldmethod=syntax
set foldlevelstart=99
set fileencodings=ucs-bom,utf-8,default
set history=50
set hlsearch
set incsearch
set nomodeline
set magic
set mouse=a
set noantialias
set mousemodel=popup
set mousehide
set ruler
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
set smartcase
set tabstop=2
set termencoding=utf-8
set viminfo='20,\"500
set window=29

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

"" highlight brackets
hi MatchParen cterm=bold ctermbg=darkmagenta ctermfg=white
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 12

runtime! macros/matchit.vim
""OSX stuff  
if (has("mac") || has("macunix"))
  noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
endif
" vim: set ft=vim :
