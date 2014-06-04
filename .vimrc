" Installed plugins
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
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"
" colorscheme
syntax on
syntax enable
set background=dark
set colorcolumn=100
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set number
set ruler
set backspace=indent,eol,start
set laststatus=2
set hlsearch
set cursorline
set cursorcolumn

hi CursorLine NONE ctermbg=NONE
hi CursorColumn NONE ctermbg=NONE
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
hi LineNr ctermfg=grey

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

"
"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"
" Delete white space errors on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

"autocmd!
autocmd BufWrite * call DeleteTrailingWS()

"
" NERDTree
" Toggle NERDTree window on ctrl-x
map <C-x> :NERDTreeToggle<CR>
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Reminder: Open files
" i: Open the selected file in a horizontal split window
" s: Open the selected file in a vertical split window
let NERDTreeIgnore = ['\.pyc$']

"
" python-mode
" Turn on code completion support in the plugin
let g:pymode_rope_completion = 1
" Turn on autocompletion when typing a period
let g:pymode_rope_complete_on_dot = 1
" Keymap for autocomplete
let g:pymode_rope_completion_bind = '<C-Space>'
" Extended autocompletion (rope could complete objects which have not been imported) from project)
let g:pymode_rope_autoimport = 1
" Load modules to autoimport by default
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
" Offer to unresolved import object after completion.
let g:pymode_rope_autoimport_import_after_complete = 0
" Ignore some errors
let g:pymode_lint_ignore = "E126,E127,E128,E501"

"
" mouse terror
" Send more characters for redraws
set ttyfast
"
" Enable mouse use in all modes
set mouse=a
"
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

