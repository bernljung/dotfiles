" Author Jimmy Bernljung

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'

call plug#end()

let g:one_allow_italics = 1
colorscheme one
set background=light

" Toughtbot stuff

" Leader
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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " ALE linting events
  " if g:has_async
  "   set updatetime=1000
  "   let g:ale_lint_on_text_changed = 0
  "   autocmd CursorHold * call ale#Lint()
  "   autocmd CursorHoldI * call ale#Lint()
  "   autocmd InsertEnter * call ale#Lint()
  "   autocmd InsertLeave * call ale#Lint()
  " else
  "   echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  " endif
augroup END

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·


" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 80 characters is
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" End Thoughtbot


set nocompatible


" Use deoplete.
let g:deoplete#enable_at_startup = 1

" colorscheme desert

set hlsearch
set incsearch
set clipboard=unnamed
" set timeoutlen=1000 ttimeoutlen=0

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

" FZF
inoremap <C-p> <C-\><C-N> :Files<Enter>
nnoremap <C-p> :Files<Enter>
inoremap <C-e> <C-\><C-N> :BTags<Enter>
nnoremap <C-e> :BTags<Enter>

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

tnoremap <C-a>- <C-\><C-N>:split<Enter><C-w>j
inoremap <C-a>- <C-\><C-N>:split<Enter><C-w>j
nnoremap <C-a>- :split<Enter><C-w>j

tnoremap <C-a>/ <C-\><C-N>:vsplit<Enter><C-w>l
inoremap <C-a>/ <C-\><C-N>:vsplit<Enter><C-w>l
nnoremap <C-a>/ :vsplit<Enter><C-w>l

"NERDTree
map <C-t> :NERDTreeToggle<CR>

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

" Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1
