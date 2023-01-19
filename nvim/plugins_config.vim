" ----- Plugin Config -----

" Airline Theme
let g:airline_theme='ayu_mirage'

" Airline Tabs
let g:airline#extensions#tabline#enabled = 1

" Hide NERDTree Help
let NERDTreeMinimalUI=1

" Show hidden files in NERDTree
" let NERDTreeShowHidden=1

" Hide NERDTree Cursor Line
let NERDTreeHighlightCursorline=0

" Open NERDTree when vim opens
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Vimwiki - Markdown formatt
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Vimwiki - Find All Incomplete Tasks
function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /* \[ \]/
  tab | lopen
endfunction

" Vimwiki - Find Incomplete Tasks
function! VimwikiFindIncompleteTasks()
  lvimgrep /* \[ \]/ %:p
  lopen
endfunction

" Taskwiki - Syntax
let g:taskwiki_markup_syntax = 'markdown'

" Taskwiki - Don't conceal
let g:taskwiki_disable_concealcursor = 'yes'
