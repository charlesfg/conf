set encoding=utf-8
"show the line number
set number
"size of indentation and other parameters
set sw=2
set tabstop=4 softtabstop=4
" backspace problem on mac 
" check:  https://apple.stackexchange.com/questions/173275/delete-key-doesnt-work-in-vim-on-iterm2/351434#351434
set backspace=indent,eol,start
set shiftwidth=4
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" try the best to indent
set smartindent
set et
set smarttab
set showmatch
" set colorcolumn=100
" highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme desert

"ignore the files in .gitignore
if executable('rg')
    let g:rg_derive_root='true'
endif



nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


"Mapping the Alt+RightArrow/Alt+RightLeft to move between tabs in Normal and
"Insert mode"
map <M-Right> :tabnext<CR>
map <M-Left> :tabprevious<CR>


"
" Adding to enable VIM as an IDE
"

" force to source the .vimrc from any directory
set exrc
" enforce security avoid some non-deafult .vimrc files
set secure
