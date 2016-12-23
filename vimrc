syntax on

set nocompatible
set tabstop         =4
set shiftwidth      =4
set softtabstop     =4
set undolevels      =100
set history         =500
set laststatus      =2
set undolevels      =100
set t_Co            =256
set colorcolumn     =80

set autoindent
set smarttab
set expandtab
set showcmd
set ruler
set nobackup
set noswapfile
set novisualbell
set wildmenu

filetype off

colo koehler

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" plugins installation tool
Plugin 'gmarik/vundle'
" bottom line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" awesome fs navigator
Plugin 'kien/ctrlp.vim'
" fs browser
Plugin 'scrooloose/nerdtree'
" tags window
Plugin 'majutsushi/tagbar'
" git wrapper
Plugin 'tpope/vim-fugitive'
" hg wrapper
Plugin 'phleet/vim-mercenary'
" repository viewer
Plugin 'gregsexton/gitv'
" easy commenting
Plugin 'scrooloose/nerdcommenter'
" cool snippets & prerequisite for pdv
Plugin 'SirVer/ultisnips'
" req for php documentor
Plugin 'tobyS/vmustache'
" php documentor
Plugin 'tobyS/pdv'
" handy task list navigator
Plugin 'vim-scripts/TaskList.vim'
" doc viewer in vim
Plugin 'powerman/vim-plugin-viewdoc'
" nginx highlighting
Plugin 'vim-scripts/nginx.vim'
" allows for tab mapping
Plugin 'ervandew/supertab'
" ack from vim
Plugin 'mileszs/ack.vim'
" javascript
Plugin 'pangloss/vim-javascript'
" python indentation
Plugin 'hynek/vim-python-pep8-indent'
" ansible
Plugin 'chase/vim-ansible-yaml'
" vagrant
Plugin 'markcornick/vim-vagrant'
" toggle between one window and multi-window
Plugin 'vim-scripts/ZoomWin'
" less
Plugin 'groenewege/vim-less'
" project root detector
Plugin 'airblade/vim-rooter'
" python
Plugin 'davidhalter/jedi-vim'
" fast text selection
Plugin 'terryma/vim-expand-region'
" whitespace highlight
Plugin 'bronson/vim-trailing-whitespace'
" customized snippets
Plugin 'ffeast/vim-snippets'
" experimental
Plugin 'docunext/closetag.vim'
" py docstrings
Plugin 'heavenshell/vim-pydocstring'
" vdebug
Plugin 'joonty/vdebug'
" syntastic
Plugin 'scrooloose/syntastic'
" bookmarks
Plugin 'MattesGroeger/vim-bookmarks'
" js libs syntax
Plugin 'othree/javascript-libraries-syntax.vim'
" typescript support
Plugin 'leafgarland/typescript-vim'
" vim + tmux
Plugin 'tmux-plugins/vim-tmux-focus-events'
call vundle#end()

filetype plugin indent on

" vim-ariline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'simple'

" ctrlp
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so)$',
  \ }

" syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" js syntax
let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter'

" snippets
" we don't need UltiSnips, only vim-snippets
let g:UltiSnipsSnippetDirectories = []
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" ack
let g:ack_default_options = ' -s'
nmap <leader>a *<C-O>:AckFromSearch!<CR>
vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>
cnoreabbrev a Ack

" root markers
let s:custom_markers = ['Vagrantfile', 'Dockerfile', '.vimroot']
let g:rooter_patterns = s:custom_markers + ['.git', '.hg']
let g:ctrlp_root_markers = s:custom_markers

" vim reload on vimrc save
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" nerdtree
let g:NERDTreeDirArrows = 0
let g:NERDTreeWinSize = 50
let g:NERDTreeQuitOnOpen = 1
map <Leader>f :NERDTreeToggle<CR>
map <Leader>F :NERDTreeFind<CR>

" ctags indexing
function! CtagsReindexAll()
    exec('!echo Reindexing project... && ctags -R --options='
         \. $HOME
         \. '/.vim/ctags.conf')
endfunction
map <Leader>u <ESC>
    \:call CtagsReindexAll()<CR><CR>
    \:echom 'Ctags updated'<CR><CR>

" paste mode
map <F2> :set paste<CR>

" debugging
map <F3> oimport ipdb; ipdb.set_trace()  #FIXME: breakpoint<ESC>
map <F4> oimport pudb; pu.db  #FIXME: breakpoint<ESC>

" whitespace trimming
map <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" python documenting
autocmd FileType python map <Leader>h <Plug>(pydocstring)<CR>

" php documenting
let g:pdv_template_dir = $HOME . '/.vim/bundle/pdv/templates_snip/'
autocmd FileType php map <Leader>h :call pdv#DocumentWithSnip()<CR>

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

" tagbar
map <Leader>c :TagbarToggle<CR>

" windows navigation
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
map <Leader>q <C-W>q

" nginx
au BufRead,BufNewFile /etc/nginx/* if &ft == '' | setfiletype nginx | endif

" local settings
if filereadable(glob('~/.vimrc.local'))
    source ~/.vimrc.local
endif
