" Author Jimmy Bernljung
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.vim/plugged')

  " Utility
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'wikitopian/hardmode'
  Plug 'qpkorr/vim-bufkill'
  Plug 'gilsondev/searchtasks.vim'
  Plug 'ervandew/supertab'

  " General Programming Support
  Plug 'jakedouglas/exuberant-ctags'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  " Code completion and error checking
  Plug 'scrooloose/syntastic'
    let g:syntastic_javascript_checkers=['eslint']
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


  " Git Support
  Plug 'airblade/vim-gitgutter'
  Plug 'gregsexton/gitv', {'on': ['Gitv']}
  Plug 'tpope/vim-fugitive'

  " Elixir support
  Plug 'tpope/vim-endwise'
  Plug 'mattreduce/vim-mix'
  Plug 'elixir-lang/vim-elixir'
  Plug 'mmorearty/elixir-ctags'
  Plug 'Frost/vim-eh-docs'
  Plug 'slashmili/alchemist.vim'

  " Javascript support
  Plug 'pangloss/vim-javascript'

  " Looks
  " Plug 'yuttie/comfortable-motion.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Themes
  Plug 'altercation/vim-colors-solarized'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'beigebrucewayne/skull-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'john2x/flatui.vim'
call plug#end()

let g:gitgutter_eager = 0

set guifont=Hasklug_Nerd_Font:h12
set background=dark
colorscheme solarized
set encoding=utf-8
let mapleader=" "
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2
set autowrite
set mouse=a
augroup AutoWrite
    autocmd BufLeave,FocusLost * silent! :w
augroup END

set cursorline
" set cursorcolumn
set title

filetype plugin indent on

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

set wildmode=list:longest,list:full

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Turn off search highlight
nnoremap <CR> :nohl<Enter>

set nocompatible
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard=unnamed

set number
set numberwidth=5
set relativenumber

" Exit terminal mode on Escape
tnoremap <Esc> <C-\><C-n>

" Use alt-{h,j,k,l} to navigate between windows in any mode.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" FZF
inoremap <C-p> <C-\><C-N> :Files<Enter>
nnoremap <C-p> :Files<Enter>
nmap ö :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>f :Ag <C-r>=expand('<cword>') <CR><CR>

nmap <A-w> :BD!<CR>

" Resize window
tnoremap <C-a>J <C-\><C-N> :res +5<Enter>
tnoremap <C-a>K <C-\><C-N> :res -5<Enter>
tnoremap <C-a>L <C-\><C-N> :vertical resize +5<Enter>
tnoremap <C-a>H <C-\><C-N> :vertical resize -5<Enter>
inoremap <C-a>J <C-\><C-N> :res +5<Enter>
inoremap <C-a>K <C-\><C-N> :res -5<Enter>
inoremap <C-a>L <C-\><C-N> :vertical resize +5<Enter>
inoremap <C-a>H <C-\><C-N> :vertical resize -5<Enter>
nnoremap <C-a>J  :res +5<Enter>
nnoremap <C-a>K  :res -5<Enter>
nnoremap <C-a>L  :vertical resize +5<Enter>
nnoremap <C-a>H  :vertical resize -5<Enter>

tnoremap <C-w>- <C-\><C-N>:split<Enter><C-w>j
inoremap <C-w>- <C-\><C-N>:split<Enter><C-w>j
nnoremap <C-w>- :split<Enter><C-w>j

tnoremap <C-w>/ <C-\><C-N>:vsplit<Enter><C-w>l
inoremap <C-w>/ <C-\><C-N>:vsplit<Enter><C-w>l
nnoremap <C-w>/ :vsplit<Enter><C-w>l

"NERDTree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Always enter terminals in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set shiftround

" Use tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap <Tab> ><CR>gv
vnoremap <S-Tab> <<CR>gv

set autoread

" For global replace
nnoremap gR :%s/<C-R>///gc<left><left><left>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Syntastic Configuration
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" Neomake settings
" autocmd! BufWritePost * Neomake
" let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
