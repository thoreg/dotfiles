" python
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
"
execute pathogen#infect()
syntax on
set background=dark
colorscheme solarized
filetype plugin indent on

" Delete white space errors on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

"autocmd!
autocmd BufWrite * call DeleteTrailingWS()
