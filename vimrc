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
" hg wrapper
Bundle 'phleet/vim-mercenary'
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
" allows for tab mapping
Bundle 'ervandew/supertab'
" ack from vim
Bundle 'mileszs/ack.vim'
" javascript
Bundle 'pangloss/vim-javascript'
" req for easytags
Bundle 'xolox/vim-misc'
" ctags for all languages
Bundle 'xolox/vim-easytags'
" python indentation
Bundle 'hynek/vim-python-pep8-indent'
" ansible
Bundle 'chase/vim-ansible-yaml'
" vagrant
Bundle 'markcornick/vim-vagrant'
" toggle between one window and multi-window
Bundle 'vim-scripts/ZoomWin'
" less
Bundle 'groenewege/vim-less'
" c++ indentation
Bundle 'vim-scripts/google.vim'

" vim-ariline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'simple'

" ctrlp
map <Leader>b :CtrlPBuffer<CR>

" ack
let g:ack_default_options = ''
" highlight word at cursor and then Ack it.
nnoremap <leader>a *<C-O>:AckFromSearch!<CR>

" nerdtree
let g:NERDTreeDirArrows = 0
let g:NERDTreeWinSize = 50
map <Leader>f :NERDTreeToggle<CR>
map <Leader>F :NERDTreeFind<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ctags
let g:easytags_async = 1
let g:easytags_auto_update = 0
let g:easytags_on_cursorhold = 0
let b:easytags_auto_highlight = 0
let g:easytags_events = ['BufWritePost']
let g:easytags_by_filetype = '~/.vim/tags'
map <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
map <Leader>u <ESC>:UpdateTags -R %:p:h<CR>

" paste mode
map <Leader>p :set paste<CR>

" c++ namespaces
set cino=N-s

" php documenting
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip/"
map <Leader>h :call pdv#DocumentWithSnip()<CR>

" git-fugitive
map <Leader>gs <ESC>:Gstatus<CR>
map <Leader>gd <ESC>:Gdiff<CR>
map <Leader>gb <ESC>:Gblame<CR>
map <Leader>gw <ESC>:Gwrite<CR>
map <Leader>gc <ESC>:Gcommit<CR>
map <Leader>gca <ESC>:Gcommit -a<CR>
map <Leader>gp <ESC>:Git push<CR>

" gitv
map <Leader>gv <ESC>:Gitv<CR>
let g:Gitv_WipeAllOnClose = 1

map <Leader>c :TlistToggle<CR>

" windows navigation
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
map <Leader>q <C-W>q

" nginx
au BufRead,BufNewFile /etc/nginx/* if &ft == '' | setfiletype nginx | endif
