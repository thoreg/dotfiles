set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set number
set cursorline
set colorcolumn=100
set statusline+=%F\ %l\:%c
set laststatus=2
set ttyfast              " Send more characters for redraws
set mouse=a              " Enable mouse use in all modes
set history=1000         " Remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set autowriteall         " Save the file on buffer switch
set linespace=2
set gfn=Monaco:h12

execute pathogen#infect()
filetype plugin indent on

syntax enable

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='dark'

set guifont=Inconsolata\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

set background=dark
if has('gui_running')
    colorscheme solarized
else
    colorscheme tender
endif

" set background=light
" colorscheme solarized

set tags=.tags,tags
map <F12> :!/usr/bin/ctags -R .<CR>
map <F1> :tnext<CR>
map <F2> :bnext<CR>
map <F3> :bprevious<CR>

nnoremap H gT
nnoremap L gt


" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

au BufNewFile,BufRead *.html set filetype=htmldjango
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Delete white space errors on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * call DeleteTrailingWS()


" Jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=100
    autocmd WinEnter * set cul
    autocmd WinLeave * set colorcolumn=0
    autocmd WinLeave * set nocul
augroup END


" Run pep8 on every save
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1
let g:flake8_show_quickfix=1
let g:flake8_show_in_file=1


" Nerdtree
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Ignore files with the following extensions
let NERDTreeIgnore = ['\.pyc$']
" Open File in a new Tab on double click
let g:NERDTreeMapOpenInTabSilent = '<2-LeftMouse>'


" CtrlP - fuzzy finder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc


" VIM - Jedi
" Completion <C-Space>
" Goto assignments <leader>g (typical goto function)
" Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
" Show Documentation/Pydoc K (shows a popup with assignments)
" Renaming <leader>r
" Usages <leader>n (shows all the usages of a name)


" isort - select visual block and press ctrl-i or just execute :Isort
let g:vim_isort_map = '<C-i>'

" Mappings
" default leader is: \
nnoremap <leader>p oimport ipdb; ipdb.set_trace()<Esc>
" Quick close for quickfix window
nnoremap <leader>q :ccl<CR>
nnoremap <leader>j :%!python -m json.tool<CR>
nnoremap <leader>c oconsole.log(


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Disable the arrow keys - to enforce the use of hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar



command WQ wq
command Wq wq
command W w
command Q q

" :Remove: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Remove, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
"
" make jj do esc"
inoremap jj <Esc>
"
" Quote
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
