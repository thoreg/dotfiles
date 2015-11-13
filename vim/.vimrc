set tabstop=8
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

execute pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark
colorscheme industry
"set background=light
"colorscheme darkblue

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
nnoremap <leader>p oimport pdb; pdb.set_trace()<Esc>
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
