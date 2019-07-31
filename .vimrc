set nocompatible
syntax on
set wrap
set lbr
set encoding=utf-8
set sessionoptions-=blank
set incsearch
set rnu
set hlsearch
colorscheme pablo

" Russian langmap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"Settings
syntax on
filetype plugin indent on
set foldmethod=syntax
set foldlevel=99

set history=200

set ignorecase
set smartcase

set autochdir

set number
set ruler
set cursorline

" Set Proper Tabs
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab
set list
set listchars=tab:>-,trail:¶

" Always display the status line
set laststatus=2

" Enable Elite mode
let g:elite_mode=1

set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly

" Theme and Styling
"set t_Co=256
"set background=dark

" netrw
let g:netrw_banner = 0

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <Space> <nop>
let mapleader = "\<Space>"

map <leader>, :FZF<CR>

nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>rr :! %<CR>
nnoremap <leader>nh :nohl<CR>

"copy paste
nnoremap <leader>c "+y
vnoremap <leader>c "+y

nnoremap <leader>v "+p
vnoremap <leader>v "+p

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>p "+p
vnoremap <leader>p "+p


nnoremap <leader>w :w<CR>

"doesn't work
nnoremap <leader>rs :silent !%<CR>

let &wildcharm = &wildchar
cnoremap <C-n> <DOWN>
cnoremap <C-p> <UP>

"tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"windows
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-l> :wincmd l<CR>


"fix for easytags lags
set regexpengine=0


function! MakeSolution() abort
  let makeprg = 'msbuild /nologo /v:q /property:GenerateFullPaths=true /clp:ErrorsOnly '
  let sln = fnamemodify(OmniSharp#FindSolution(), ':.')
  echomsg makeprg . sln
  call asyncdo#run(1, makeprg . sln)
endfunction

nnoremap <silent> <buffer> <leader>mk :call MakeSolution()<CR>
