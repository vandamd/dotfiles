"
"                        _                 _             _                              __ _       
"                       | |               ( )           (_)                            / _(_)      
"  __   ____ _ _ __   __| | __ _ _ __ ___ |/ ___  __   ___ _ __ ___     ___ ___  _ __ | |_ _  __ _ 
"  \ \ / / _` | '_ \ / _` |/ _` | '_ ` _ \  / __| \ \ / / | '_ ` _ \   / __/ _ \| '_ \|  _| |/ _` |
"   \ V / (_| | | | | (_| | (_| | | | | | | \__ \  \ V /| | | | | | | | (_| (_) | | | | | | | (_| |
"    \_/ \__,_|_| |_|\__,_|\__,_|_| |_| |_| |___/   \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                                                             __/ |
"                                                                                            |___/ 

" This is Vandam Dinh's vim configuration file
                           
let mapleader = ","
nmap <leader>w :w!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
filetype plugin on
filetype indent on
set so=7
set wildmenu
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2
syntax enable
set encoding=utf8
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
map <space> /
map <silent> <leader><cr> :noh<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
set number
set laststatus=2
