" Do not remove the following 4 lines
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
"------------------------------------------

"set encoding=utf-8
let loaded_matchparen=1
" Okay, you can start changing stuff now
" Basic stuff
"" Things you might want to change
set nocompatible
colorscheme slate 

"" You probably don't want to change these
set hidden
syntax on
set ts=4
set t_Co=256
set ic
set hls
set lbr
" These affect viewports
"" Split windows equally
set equalalways
"" New vertical splits to the right of current
"" New horizontal splits below current
set splitright splitbelow
"""let mapleader="\"
"" Change tmp file path
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp
"" Change tags path
set tags=.tags,tags;/
"" Some administrivia
"" supress warnings
set autoread
"" allow backspacing over everything
"" we like big histories!
set history=1000
"" For colorized in 256 mode

" relative number
set number

"" Gundoo 
nnoremap <F6> :GundoToggle<CR>

"" Gist vim
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'chromium %URL% &'
let g:gist_show_privates = 1

"" Nerdtree stuff
nnoremap <F1> :NERDTreeToggle<CR>

"" Syntastic
nnoremap <C-E> :SyntasticCheck<CR>


"" Rails
nnoremap <C-p> :completefunc()<CR>
nnoremap <F7> :Rlib 
nnoremap <F8> :Rake 
nnoremap <F9> :Rmodel 
nnoremap <F10> :Rview 
nnoremap <F11> :Rcontroller 
nnoremap <F12> :Rgenerate 
nnoremap <C-x> :FufBuffer<CR>

" Cursor highlight
:hi CursorLine   cterm=NONE ctermbg=8
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white 
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline

"" We need some buffering
set lazyredraw
set wildmenu
set wrap
set smartindent
filetype plugin indent on

" Moving around
"map! <S-Left> b
"map! <S-Right> w

" Resize vertical slit easily
"nnoremap <C-> :vertical res +1<CR> 
"nnoremap <C-.> :vertical res -1<CR>

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby set nocursorline
autocmd FileType ruby,eruby set ts=2 
"improve autocomplete menu color
highlight Pmenu ctermbg=238


" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
set foldmethod=manual

" Html 5 plugin
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" Powerline statusbar
" Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  set statusline+=\ %{fugitive#statusline()}
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Turn off rails bits of statusbar
  let g:rails_statusline=0

" Fuzzyfinder
nnoremap <F2> :FufFile<CR>
nnoremap <F3> :FufCoverageFile<CR>
nnoremap <F4> :FufBuffer<CR>


" GUI setting
if has('gui_running')
	set guifont=Liberation\ Mono\ 8
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
endif
