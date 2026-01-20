" --- config ---
filetype plugin indent on
syntax on
set mouse=a

" Set mouse protocol based on tmux detection
if &term =~ '^screen' || exists('$TMUX')
  " Inside tmux
  set ttymouse=sgr
  set term=screen-256color
else
  " Outside tmux
  if !has('nvim')
    set ttymouse=sgr
  endif
  set term=xterm-256color
endif

" Fix mouse scrolling in tmux
if has("mouse_sgr")
    set ttymouse=sgr
elseif has("mouse_xterm")
    set ttymouse=xterm2
endif

" Set scroll amount for mouse
set mousescroll=vert:5,hor:5

set t_ut=
set ttyscroll=1
set nocompatible
set autoread
set number
set showcmd
set wildmenu
set ruler
set ttimeoutlen=50
set ttyfast
set lazyredraw
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set linebreak
set nocindent
set nosmartindent
set breakindent
set breakindentopt=shift:2,min:40,sbr
set colorcolumn=80,120
set shell=/bin/bash\ -i
set shellcmdflag=-ic
set viminfo=
autocmd TextChanged,TextChangedI <buffer> if expand('%') != '' | silent write | endif
" --- language specific ---
au BufNewFile,BufRead *.py setlocal foldlevel=0 tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab

" --- colorchange ---
highlight ColorColumn ctermbg=LightGray cterm=None
hi CursorLine ctermbg=White cterm=none
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" --- folding ---
set foldmethod=indent
set foldclose=all

" --- mappings ---
"
" default move over line wraps
map j gj
map k gk
" move between splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
" move between buffers
map <C-l> <Esc>:bprev<CR>
map <C-h> <Esc>:bnext<CR>
" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" --- leader ---
let mapleader = ","
nnoremap <leader>r :Explore .<CR>
nnoremap <leader>p "+p
vnoremap <leader>p "+p
inoremap <leader>p <Esc>"+pi
vnoremap <leader>y "+y
nnoremap <leader>b :!black %<CR>
nnoremap <leader>f :Black<CR>

" copy

" --- commenting ---
" Commenting blocks of code.
au FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
au FileType sh,ruby,python              let b:comment_leader = '# '
au FileType vim                         let b:comment_leader = '" '
noremap <silent> ,/ :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,? :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" --- plug ---
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

" List your plugins here
Plug 'EgZvor/vim-black'

call plug#end()
