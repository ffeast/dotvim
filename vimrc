syntax on

set tabstop         =4
set shiftwidth      =4
set softtabstop     =4
set undolevels      =100
set history         =500
set laststatus      =2
set undolevels      =100
set t_Co            =256

set autoindent
set number
set smarttab
set expandtab
set showcmd
set ruler
set nobackup
set noswapfile
set novisualbell
set autochdir
set wildmenu

colo koehler

filetype off
filetype plugin on
filetype indent on

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugins installation tool
Bundle 'gmarik/vundle'
" bottom line
Bundle 'bling/vim-airline'
" awesome fs navigator
Bundle 'kien/ctrlp.vim'
" fs browser
Bundle 'scrooloose/nerdtree'
" tags window
Bundle 'vim-scripts/taglist.vim'
" git wrapper
Bundle 'tpope/vim-fugitive'
" repository viewer
Bundle 'gregsexton/gitv'
" easy commenting
Bundle 'scrooloose/nerdcommenter'
" cool snippets & prerequisite for pdv
Bundle 'SirVer/ultisnips'
" req for php documentor
Bundle 'tobyS/vmustache'
" php documentor
Bundle 'tobyS/pdv'
" handy task list navigator
Bundle 'vim-scripts/TaskList.vim'
" doc viewer in vim
Bundle 'ffeast/vim-plugin-viewdoc'
" nginx highlighting
Bundle 'vim-scripts/nginx.vim'

if has('python')
Bundle 'klen/python-mode'
endif

" minibufexplorer
let g:miniBufExplAutoStart = 1

" vim-ariline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'simple'

" nerdtree
let g:NERDTreeDirArrows = 0

" php documenting
map <buffer> <Leader>p :call pdv#DocumentWithSnip()<CR>
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip/"

" git-fugitive
map <Leader>gs <ESC>:Gstatus<CR>
map <Leader>gd <ESC>:Gdiff<CR>
map <Leader>gw <ESC>:Gwrite<CR>
map <Leader>gc <ESC>:Gcommit<CR>
map <Leader>gca <ESC>:Gcommit -a<CR>
map <Leader>gp <ESC>:Git push<CR>

" gitv
map <Leader>gv <ESC>:Gitv<CR>
let g:Gitv_WipeAllOnClose = 1

" python-mode
let g:pymode_lint = 1
let g:pymode_lint_write = 0
let g:pymode_folding = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_rope_complete_on_dot = 0

map <Leader>c :TlistToggle<CR>
map <Leader>f :NERDTreeToggle<CR>

" windows navigation
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" nginx
au BufRead,BufNewFile /etc/nginx/* if &ft == '' | setfiletype nginx | endif
