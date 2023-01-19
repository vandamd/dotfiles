" Vandam's Neovim Configuration
" Split into three files
"   1. init.vim - General Settings
"   2. plugins.vim - Where I install my plugins
"   3. plugins_config.vim - Where I configure my plugins






" ------ General Settings ------

let mapleader = ","
nmap <leader>w :w!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
filetype plugin on
filetype indent on
set nocompatible
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
set colorcolumn=72
highlight ColorColumn ctermbg=238
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
set number relativenumber
set laststatus=2
set clipboard+=unnamedplus


" ------ Keybinds ------
" Toggle NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" Tab Navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Vimwiki
nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>

" ------ Plugins ------
source ~/.config/nvim/plugins.vim




" ------ Plugin Config ------
source ~/.config/nvim/plugins_config.vim


