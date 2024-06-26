set nocompatible
filetype on
filetype off
" Vim Plug Stuff
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'lervag/vim-latex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'edkolev/promptline.vim'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-endwise'
Plug 'rizzatti/dash.vim'
Plug 'itchyny/lightline.vim'
Plug 'ajmwagar/vim-deus'
call plug#end()
" End Vim Plug Definition Block, Start Post-Install Hooks
function! Installjshint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g jshint
  endif
endfunction
Plug 'scrooloose/syntastic', { 'do': function('Installjshint') }
" End Vim Plug Stuff
filetype plugin indent on
filetype on
"line stuff
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
"promptline stuff
let g:promptline_preset = {
  \'a' : ['%m', '%n'],
  \'z' : [promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)'],
  \'c' : ['%~'],
  \'warn' : [promptline#slices#last_exit_code()]}
let g:promptline_powerline_symbols = 0
let g:promptline_symbols = {
    \ 'left'       : '',
    \ 'left_alt'   : '>',
    \ 'dir_sep'    : ' / ',
    \ 'truncation' : '...',
    \ 'vcs_branch' : '',
    \ 'space'      : ' '}

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
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
"latex stuff
let g:livepreview_previewer = 'open -a Preview'
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
colors deus
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
set timeoutlen=100
set ttimeoutlen=0
set viminfo='20,\"500
set window=29
set clipboard=unnamed
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

"" highlight brackets
hi MatchParen cterm=bold ctermbg=darkmagenta ctermfg=white
set guifont=Monaco\ for\ Powerline\ 12

runtime! macros/matchit.vim
""OSX stuff  
if (has("mac") || has("macunix"))
  noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
endif
" vim: set ft=vim :
