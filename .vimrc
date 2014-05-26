" Installed plugins
" pip install --user git+git://github.com/Lokaltog/powerline
" https://github.com/kien/ctrlp.vim
" https://github.com/klen/python-mode
" https://github.com/Lokaltog/powerline
" https://github.com/scrooloose/nerdtree
"
" Encoding stuff ...
set enc=utf-8
set encoding=utf-8
set fileencoding=utf-8

"
" pathogen.vim makes it super easy to install plugins and runtime files in
" their own privateii directories.
"
" execute pathogen#infect()
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"
" power_line 
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"
" colorscheme
syntax on
syntax enable
set background=dark
set colorcolumn=100
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorcolumn
set number
set ruler
set backspace=indent,eol,start
set laststatus=2
set hlsearch

"
" ctrlp - Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc    

"
" Ignore case when searching
set ignorecase

"
" Tab settings for Python development 
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

"
" show white space errors
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" del whitespace errors
map <F1> :1,$s/[ <tab>]\+$// <CR>

"
"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"
" NERDTree
" Toggle NERDTree window on ctrl-x
map <C-x> :NERDTreeToggle<CR>
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


