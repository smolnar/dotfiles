" init
" {{{
call pathogen#infect()
call pathogen#helptags()

set nocompatible
syntax on
set encoding=utf-8

" }}}

" Settings
" {{{
  filetype plugin indent on

  colorscheme Monokai

  set backspace=indent,eol,start " make backspace a more flexible
  set encoding=utf-8
  let loaded_matchparen=1 " dont match paranthesis
  set ts=2
  set sw=2
  set autoindent
  set backup
  set backupdir=~/.vim/tmp/backup " where to put backup files
  set directory=~/.vim/tmp/swap " directory to place swap files in
  set undodir=~/.vim/tmp/undo " directory to place undo files in
  set t_Co=256
  set ic
  set hlsearch
  set lbr
  set undofile
  set ttyfast
  set gdefault
  set list
  set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮,nbsp:~
  set mouse=a " use mouse for everything
  set equalalways " split windows equally
  set splitright splitbelow " new splits right from current and other below
  set autoread " supress warnings
  set wildmenu
  set wildmode=full
  set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
  set clipboard+=unnamed,unnamedplus,autoselect
  set history=1000
  set tags=.tags;/
  set ttyfast
  set ttimeoutlen=50  " Make Esc work faster
  set number
  set incsearch
  set hls
  set ignorecase
  set smartcase
  set novisualbell " do not blink
  set lazyredraw " get faster
  set nostartofline
  set linespace=0
  let c_no_trail_space_error = 1 " see c errors
  let java_space_errors = 1 " see java errors
  set showcmd
  set ruler
  set scrolloff=5 " Keep 10 lines (top/bottom) for scop
  set sidescrolloff=10 " Keep 5 lines at the size
  set showmode
  set showbreak=↪

  set expandtab
  set wrap
  set nofoldenable
  set foldmethod=manual
  set showmatch

  set infercase " case inferred by default
  set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
  set shiftwidth=2 " auto-indent amount when using >> <<
  set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
  set tabstop=4 " real tabs should be 4, and they will show with set list on

  set completeopt=longest,menu,preview

" Advanced macros
" {{{

  " Cursor highlight
  :hi CursorLine   cterm=NONE ctermbg=8
  :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
  :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
  set cursorline

  "improve autocomplete menu color
  highlight Pmenu ctermbg=238
  " }}}
  "

  " Removes trailing spaces
  function! TrimWhiteSpace()
    %s/^\s*$//e
    ''
  :endfunction

  " Filter and trim whitespaces
  autocmd FileWritePre * :call TrimWhiteSpace()
  autocmd FileAppendPre * :call TrimWhiteSpace()
  autocmd FilterWritePre * :call TrimWhiteSpace()
  autocmd BufWritePre * :call TrimWhiteSpace()

  map <F8> :call TrimWhiteSpace()<CR>
  map! <F8> :call TrimWhiteSpace()<CR>

  " Use relative numbering in insert mode
  autocmd InsertEnter * :set relativenumber
  autocmd InsertLeave * :set number

  "}}}

" Binding
" {{{
" Map leader
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
  nnoremap <leader>v <C-w>v<C-w>l

  " open horizontal  split and switch to it
  nnoremap <leader>h :split<CR>

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

  " run ctags silently
  map <leader>t :silent! !ctags -R . &<CR>

  " copy from clipboard with ease
  nnoremap <leader>p "+p
  nnoremap <leader>y "+y
  " }}}
  "
  " start ack search
  nnoremap <leader>a :Ack 

  " reformat whole file
  nnoremap <leader>= ggVG=

" convert {} to do/end
  nnoremap <leader>b ^f{cwdo<cr><esc>$xxoend<esc>

  " }}}

" Filetypes
" {{{

  " HTML, XML {{{
  augroup FTHtml
    au!
    autocmd FileType html,xhtml,wml,cf      setlocal ai et sta sw=2 sts=2
    autocmd FileType xml,xsd,xslt           setlocal ai et sta sw=2 sts=2 ts=2
    autocmd FileType html setlocal iskeyword+=~

  augroup END

  " CSS, SCSS {{{
  augroup FTCss
    au!
    au BufRead,BufNewFile *.scss.erb set ft=scss
    autocmd FileType css,scss  silent! setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType css,scss  setlocal iskeyword+=-
    autocmd FileType css,scss   setlocal ai et sta sw=2 sts=2
    autocmd FileType scss,sass  syntax cluster sassCssAttributes add=@cssColors
    au FileType css,scss nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
    " Make {<cr> insert a pair of brackets in such a way that the cursor is
    " correctly positioned inside of them AND the following code doesn't get unfolded.
    au FileType css,scss inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>k==A<bs>
  augroup END
  " }}}

  " }}}
  " Ruby {{{
  augroup FTRuby
    au!
    autocmd FileType eruby,yaml,ruby        setlocal ai et sta sw=2 sts=2
    autocmd BufNewFile,BufRead *.html.erb   set filetype=eruby.html  " load html snippets along with erb
    autocmd FileType ruby,eruby             let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby             let g:rubycomplete_classes_in_global=1
    autocmd FileType ruby,eruby             let g:rubycomplete_buffer_loading = 1
  augroup END
  " }}}

  " Coffescript
  " {{{
  au BufNewFile,BufReadPost *.coffee setl sw=2 expandtab
  "}}}

  augroup C
    au!
    ""autocmd FileType c,cpp,h,hpp     colorscheme molokai
  augroup END

  " }}}

  " Git {{{
    augroup FTGit
      au!
      autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
      autocmd FileType gitcommit setlocal spell
    augroup END
  " }}}

" Plugins
" {{{

  " Html5 plugin
  " {{{
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

  " Easytags
  " {{{
  let g:easytags_dynamic_files = 1
  let g:easytags_auto_highlight = 0
  let g:easytags_on_cursorhold = 0
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

  " CtrlP
  " {{{
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  nnoremap <F3> :CtrlP<CR>
  nnoremap <F4> :CtrlPBuffer<CR>
  nnoremap <F2> :CtrlPDir<CR>
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll)$'
        \ }
  map <leader>f :CtrlP<cr>
  map <leader>b :CtrlPMRU<cr>
  map <leader>gv :CtrlP app/views<cr>
  map <leader>gc :CtrlP app/controllers<cr>
  map <leader>gm :CtrlP app/models<cr>

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
  nnoremap <leader>g :GundoToggle<CR>
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
  nnoremap <F6> :Rails 
  nnoremap <F7> :Rgenerate 
  nnoremap <F8> :Rake 
  nnoremap <F9> :Rinitializer 
  nnoremap <F10> :Rmodel 
  nnoremap <F11> :Rview 
  nnoremap <F12> :Rcontroller 

  nnoremap <leader>r :Rails 
  nnoremap <leader>rc :Rails console<CR>
  nnoremap <leader>rg :Rgenerate 
  nnoremap <leader>rr :Rake 
  nnoremap <leader>ri :Rinitializer 
  " routes leads to empty initializer path
  nnoremap <leader>ro :Rinitializer<CR>
  nnoremap <leader>rv :Rview 
  nnoremap <leader>rc :Rcontroller 
  nnoremap <leader>rm :Rmodel 


  " set rails status line
  let g:rails_statusline = 1
  " }}}


" }}}

" GUI setting
" {{{
if has('gui_running')
  set guifont=Dejavu\ Sans\ Mono\ 9
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

  " Bindings
  " {{{
    nnoremap <c-o> :browse tabnew :pwd<CR>
    nnoremap <c-a-s> :browse saveas :pwd<CR>
    nnoremap <c-a-w> :wq<CR>
  " }}}
endif
" }}}
"
