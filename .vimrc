"
set enc=utf-8
set encoding=utf-8
set fileencoding=utf-8
" set termencoding=iso-8859-1
"
" pathogen for bundle handling
call pathogen#infect()
"
" colorscheme settings
syntax on
syntax enable
set background=light
let g:solarized_termcolors=512
colorscheme solarized
set colorcolumn=100
"set cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline
set cursorcolumn
set number

" map <F9> :set nonumber<CR>
set ruler
set statusline=%<%F%h%m%r%h%w%y\ %=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
set backspace=indent,eol,start
set laststatus=2
set hlsearch
"
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
"
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
"set autoindent
"
" white space errors
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
" FileTypeStuff
filetype on " enables filetype detection
filetype plugin indent on " enables file type specific plugins
au FileType py set textwidth=79 " PEP-8 Friendly"
"
"
" NERD_tree config
"let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
"let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>
"
"
" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1

map <F7> :w!<CR>:!aspell --lang=german check %<CR>:e! %<CR>


"ctags -R -f ~/.vim/tags/python.ctags /opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/
map <F8> :!ctags -R -f 'tags'<CR>
map <F4> :tn<CR>
map <F5> :tp<CR>
set tags=tags,/Volumes/Image/satchmo/tags,$HOME/.vim/tags/python.ctags
"
" OmniCompletion
"set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"if has("python")
"    python import sys,os
"    python sys.path.append('/home/thoreg/workspace/momox/src/')
"    python os.environ['DJANGO_SETTINGS_MODULE'] = 'momox.settings'
"endif
"inoremap <C-Space> <C-x><C-o>
"
"
" FuzzyFinder - shortcuts
map FF :FufCoverageFile<CR>
map FT :FufTag<CR>
map FB :FufBuffer<CR>
"
" PyFlakesStuff
let g:pyflakes_use_quickfix = 0
"
"
" PyLint
" Disable pylint checking every save
let g:pymode_lint_write = 0
"let g:pymode_lint_write = 1
"
" Load pylint code plugin
" let g:pymode_lint = 1
"
" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
" let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
"
" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
" let g:pymode_lint_ignore = "E501"
"
" Select errors and warnings
" E.g. "E4,W"
" let g:pymode_lint_select = ""
"
" Run linter on the fly
" let g:pymode_lint_onfly = 0
"
" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
" let g:pymode_lint_config = "$HOME/.pylintrc"
"
" Check code every save
" let g:pymode_lint_write = 1
"
" Auto open cwindow if errors be finded
" let g:pymode_lint_cwindow = 1
"
" Show error message if cursor placed at the error line
" let g:pymode_lint_message = 1
"
" Auto jump on first error
" let g:pymode_lint_jump = 0
"
" Hold cursor in current window when quickfix is open
" let g:pymode_lint_hold = 0
"
" Place error signs
" let g:pymode_lint_signs = 1
"
" Maximum allowed mccabe complexity
" let g:pymode_lint_mccabe_complexity = 8
"
" Minimal height of pylint error window
" let g:pymode_lint_minheight = 3
"
" Maximal height of pylint error window
" let g:pymode_lint_maxheight = 6
"
"set cursorline

set wildmode=list:longest

set guioptions-=T
if has('gui_macvim')
"    set guifont=Inconsolata:h16
" Desktop
"set guifont=Inconsolata:h15
" Laptop arbeit
"set guifont=Inconsolata:h12
set guifont=Inconsolata:h13
else
    set guifont=Inconsolata\ 13
endif
"
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" resource .vimrc if it has been edited
autocmd BufWritePost .vimrc source %
autocmd BufWrite * :call DeleteTrailingWS()
"
"
" mappings
"
let mapleader = ","
" show whitespaces on/off
nmap <leader>l :set list!<CR>
"
" disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>
" disable del key
imap <DEL> <nop>
nmap <DEL> <nop>
"
" moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"
" abreviations
"iab #i #include
iab ed </div>
iab ep </p>
iab br <br/>
