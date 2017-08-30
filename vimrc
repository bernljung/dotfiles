" Author Jimmy Bernljung

set nocompatible              " be iMproved, required
filetype off                  " required

set t_Co=256   " This is may or may not needed.

set background=light
syntax on
colorscheme PaperColor
set number
set laststatus=2
set hlsearch
set incsearch
set clipboard=unnamed
set timeoutlen=1000 ttimeoutlen=0

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" scroll with mouse wheel
set mouse=a

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

"NERDTree
map <C-b> :NERDTreeToggle<CR>
set backspace=indent,eol,start

" Jump between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap <Tab> >>
vnoremap <S-Tab> <<

" Autocomplete brackets
inoremap { {<CR>}<Esc>ko

set autoread

" For global replace
nnoremap gR * :%s/<C-R>///gc<left><left><left>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules
