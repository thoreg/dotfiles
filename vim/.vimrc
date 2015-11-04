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

set background=dark
colorscheme industry
"set background=light
"colorscheme darkblue

execute pathogen#infect()
syntax on
filetype plugin indent on

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

" Run pep8 on every save
autocmd BufWritePost *.py call Flake8()

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

" CtrlP - fuzzy finder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
