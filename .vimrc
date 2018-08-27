set nocompatible
syntax on
set wrap
set lbr
set encoding=utf-8
set sessionoptions-=blank
set incsearch

call plug#begin('~/vimfiles/plugged')

" Utility
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'hushicai/tagbar-javascript.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/BufOnly.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'
Plug 'dkprice/vim-easygrep'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-surround'

" Generic Programming Support
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'

" Mapping
Plug 'https://github.com/tpope/vim-unimpaired'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
"Plug 'jaxbot/github-issues.vim'

" PHP Support
Plug 'phpvim/phpcd.vim'
Plug 'tobyS/pdv'

" Theme / Interface
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'junegunn/limelight.vim'
Plug 'mkarmona/colorsbox'
Plug 'romainl/Apprentice'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'AlessandroYorba/Sierra'
Plug 'daylerees/colour-schemes'
Plug 'effkay/argonaut.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'colepeters/spacemacs-theme.vim'
" Other
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'https://github.com/pangloss/vim-javascript'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

"Settings
syntax on
filetype plugin indent on
set foldmethod=syntax

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
set t_Co=256
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

let g:syntastic_javascript_checkers = ['eslint']

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

"javascript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:tigris#enabled = 1

let g:EasyGrepWindow = 0

" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <Space> <nop>
let mapleader = "\<Space>"

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

let &wildcharm = &wildchar
cnoremap <C-j> <DOWN>
cnoremap <C-k> <UP>

tnoremap <Esc> <C-\><C-n>
