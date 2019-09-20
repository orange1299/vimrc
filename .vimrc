set encoding=utf-8
scriptencoding utf-8

"autocmd BufNewFile *.cpp 0r $HOME/C/template/cpp.cpp
""autocmd BufNewFile *.c 0r ~\Documents\c++\template.c
colorscheme molokai
"colorscheme hybrid 
syntax on
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark
"let g:hybrid_termcolors=256
set t_Co=256

inoremap <C-a> <C-o>0
inoremap <C-s> <C-o>$
inoremap " ""<LEFT>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap {<Enter> {}<left><Return><ESC><S-o>
"inoremap (" ("");<LEFT><LEFT><LEFT>
inoremap , ,<SPACE>
inoremap // //<SPACE> 

set number
set wrap
set showmatch
set matchtime=2
set title
set showmatch
"set list
"set listchars=tab:>
"set listchars=eol:↲

set guioptions+=a
"set clipboard=unnamedplus

set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set cursorline
set cursorcolumn

set hlsearch
set incsearch
set ignorecase
set smartcase

set laststatus=2

"nnoremap <BS>
"nnoremap! <BS>
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

set wildmenu wildmode=list:longest,full

set clipboard=unnamed,autoselect
inoremap <silent> jj <ESC>
"inoremap <silent> <C-k> <UP>
"inoremap <silent> <C-j> <UP>
"inoremap <silent> <C-h> <UP>
"inoremap <silent> <C-l> <UP>

call plug#begin()
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode'
    \ }
    \ }

function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
  
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
    
function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
      
function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

