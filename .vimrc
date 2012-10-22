" init 
" {{{
call pathogen#infect()
call pathogen#helptags()
" }}}

" settings 
" {{{
" plugins
filetype plugin indent on

colorscheme Monokai 
set encoding=utf-8
let loaded_matchparen=1 " dont match paranthesis
set backspace=2 				" backspace similar to other gui apps
set nocompatible
" set hidden 						" hide modified buffers
syntax on
set ts=2
set sw=2
set autoindent
set t_Co=256
set ic
set hlsearch
set lbr
set mouse=a
set equalalways 				" split windows equally
set splitright splitbelow " new splits right from current and other below
set autoread 						" supress warnings
set wildmenu
set clipboard+=unnamed,unnamedplus,autoselect
set history=1000
set tag=.tags,tags;/
set directory=~/.vim/tmp/swap,~/.vim/tmp/ " set tmp dirs
set undodir=.vim/tmp/undo
set ttyfast
set number
set incsearch
set hls
set ignorecase
set smartcase 
set lazyredraw 					" get faster
set linespace=0
let c_no_trail_space_error = 1	" see java errors
let java_space_errors = 1		" see c errors
set showcmd
set ruler 
set showmode
set showbreak=↪

set expandtab
set wrap
set textwidth=80
set foldenable
set foldmethod=manual

set completeopt=longest,menu,preview

" Cursor highlight
:hi CursorLine   cterm=NONE ctermbg=8
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white 
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline

"improve autocomplete menu color
highlight Pmenu ctermbg=238
" }}}

" open every files as tab
"au BufAdd,BufNewFile .* nested tab sball "dotfiles as well

" binding 
" {{{
" map leader
let mapleader = ','

" convenient window switching
map <C-h> <C-w>j
map <C-j> <C-w>k
map <C-k> <C-w>i
map <C-l> <C-w>l

" Emacs-like keybindings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>A

" Save like a pro
nnoremap <c-s> :w<cr>

" this key combination gets rid of the search highlights
nmap <leader><space> :noh<cr>

" open vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" tabs - moving around
map <C-n> :tabnew<CR>
map <C-A-n> :tabedit %<CR> 
map <A-Right> :tabnext<cr>
map <A-Left> :tabprevious<cr>

" buffers - moving around
map <A-b-Left> :bprevious<CR>
map <A-b-Right> :bNext<CR>

" copy/paste to clipboard
map <Y> "+y<CR>

" }}}

" filetypes
" {{{

" HTML, XML {{{
augroup FTHtml
  au!
  autocmd FileType html,xhtml,wml,cf      setlocal ai et sta sw=2 sts=2
  autocmd FileType xml,xsd,xslt           setlocal ai et sta sw=2 sts=2 ts=2
  autocmd FileType html setlocal iskeyword+=~
augroup END
" }}}
" Ruby {{{
augroup FTRuby
  au!
  autocmd FileType eruby,yaml,ruby        setlocal ai et sta sw=2 sts=2
  autocmd FileType ruby,eruby set 		    omnifunc=rubycomplete#Complete
  autocmd BufNewFile,BufRead *.html.erb   set filetype=eruby.html  " load html snippets along with erb
augroup END
" }}}

" Coffescript
" {{{
au BufNewFile,BufReadPost *.coffee setl sw=2 expandtab
"}}}

augroup C
  au!
  autocmd FileType c,cpp,h,hpp     colorscheme molokai
augroup END

" }}}


" plugins
" {{{

" html5 plugin
" {{{
" Html 5 plugin
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0	
" }}}

" vim-javascript 
" {{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" }}}

" statusline 
" {{{
" Powerline statusbar
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
" }}}

" Fuzzy finder 
" {{{
" Fuzzyfinder
nnoremap <F2> :FufFile<CR>
nnoremap <F3> :FufCoverageFile<CR>
nnoremap <F4> :FufBuffer<CR>
" }}}

" gist vim 
" {{{
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'chromium %URL% &'
let g:gist_show_privates = 1
" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
" }}}

" syntastic {{{
nnoremap <C-E> :SyntasticCheck<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:synastic_quiet_warnings=1

" }}}

" Rubycomplete {{{
let g:rubycomplete_rails=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_include_object=1
let g:rubycomplete_include_objectspace=1
" }}}

" Gundo {{{
nnoremap <F6> :GundoToggle<CR>
" }}}

" Fugitive {{{
nnoremap <c>gs :Gstatus<cr>
nnoremap <c>gc :Gcommit<cr>
nnoremap <c>gd :Gdiff<cr>
" }}}

" NERDTree {{{
nnoremap <F1> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERTreeHighlightCursorLine=1
"}}}
"
" NerdTree Tabs {{{
nnoremap <c-F1> :NERDTreeTabsToggle<CR>
" }}}

" Rails
" {{{
nnoremap <C-p> :completefunc()<CR>
nnoremap <F7> :Rlib 
nnoremap <F8> :Rake 
nnoremap <F9> :Rmodel 
nnoremap <F10> :Rview 
nnoremap <F11> :Rcontroller 
nnoremap <F12> :Rgenerate 

" set rails status line
let g:rails_statusline = 1
" }}}


" }}}

" GUI setting
" {{{
if has('gui_running')
  set guifont=Liberation\ Mono\ 9
  "set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  "set guifont=Monaco\ 10
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=h
  set guioptions-=b
  set guioptions-=R
  set guioptions-=L
  set showtabline=2   " show tabs in gvim, not vim
  set guitablabel=%t  " show simple filname as tabname
  
  " bindings 
  " {{{
  nnoremap <c-o> :browse tabnew :pwd<CR>
  nnoremap <c-a-s> :browse saveas :pwd<CR>
  nnoremap <c-a-w> :wq<CR>
  " }}}
endif
" }}}
