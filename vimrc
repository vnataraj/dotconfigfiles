set nocompatible
filetype on
filetype off
"Vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'edkolev/tmuxline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"Plugin 'https://github.com/eraserhd/vim-ios/'
Plugin 'lervag/vim-latex'
Bundle "pangloss/vim-javascript"
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'mattn/gist-vim'
Plugin 'Keithbsmiley/swift.vim'
call vundle#end()
filetype plugin indent on
filetype on
"airline stuff
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
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
let g:tmuxline_preset = {
  \'a'     :  '#S',
  \'b'     :  '#W',
  \'c'     :  '#H',
  \'win'     :  '#I #W',
  \'x'      : '%a',
  \'y'      : '#W %R',
  \'z'      : '#H'}
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
if &term =~ '256color'    
  set t_ut=
endif
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
set timeoutlen=50
set viminfo='20,\"500
set window=29

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

"" highlight brackets
hi MatchParen cterm=bold ctermbg=darkmagenta ctermfg=white
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11

runtime! macros/matchit.vim
""OSX stuff  
if (has("mac") || has("macunix"))
  noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
endif
" vim: set ft=vim :
