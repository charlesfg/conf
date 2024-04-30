set encoding=utf-8
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'
" the branch specification will depend on the machine usage
"Plug 'ycm-core/YouCompleteMe', { 'branch': 'legacy-py2'}
Plug 'ycm-core/YouCompleteMe'

call plug#end()
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

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
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme gruvbox-material
set background=dark

"ignore the files in .gitignore
if executable('rg')
    let g:rg_derive_root='true'
endif


let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
" hide extra information
"let g:netrw_banner = 0
" window size in %
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_confirm_extra_conf=0
"let g:ycm_autoclose_preview_window_after_completion = 1


nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" YCM
" The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>

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

