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

" Vimwiki - No wrapping, fixes ugly links
autocmd Filetype markdown setlocal nowrap

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

" Vimwiki - Folding
let g:vimwiki_folding = 'expr'

" C/C++ Autocomplete
let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"

" Vimtex 
let g:vimtex_view_method = 'skim'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Zotcite
let zotcite_filetypes = ['markdown', 'pandoc', 'rmd', 'vimwiki']

" Zotcite - Enable Conceal and highlighting
autocmd FileType vimwiki source ~/.local/share/nvim/plugged/zotcite/after/syntax/markdown.vim

" Zotcite - Open pdf in Zotero
let zotcite_open_in_zotero = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Github Copilot
let g:copilot_enabled = 1

let g:copilot_filetypes = {
  \ 'markdown': v:true,
  \ }
