" Init
" {{{
  runtime bundle/vim-pathogen/autoload/pathogen.vim

  call pathogen#infect()
  call pathogen#helptags()

  set nocompatible
  syntax on
  set encoding=utf-8
" }}}

" Settings
" {{{
"   Basic {{{
      filetype plugin indent on

      set backspace=indent,eol,start " make backspace a more flexible
      let loaded_matchparen=1 " match paranthesis
      set backup " create backup
      set backupdir=~/.vim/tmp/backup " where to put backup files
      set undodir=~/.vim/tmp/undo " directory to place undo files in
      set undofile " create undo file
      set noswapfile
      set mouse=a " use mouse for everything
      set equalalways " split windows equally
      set splitright splitbelow " new splits right from current and other below
      set autoread " supress warnings
      set wildmenu " wildmenu when autocomplting option
      set wildmode=full " complete the full match, this is default behaviour
      set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " there files will be ignored when completing in wild menu
      set clipboard+=unnamed,unnamedplus,autoselect " share clipboard
      set history=1000
      set undolevels=700
      set tags=.tags;/ " save tags generated for files in current working directory
      set ttyfast " i got a fast terminal!
      set ttimeoutlen=50  " Make Esc work faster

    " }}}

    " UI {{{
      syntax enable
      set background=dark
      colorscheme Monokai

      set tabstop=4 " when there's tab, it should be indented by 4 spaces
      set shiftwidth=2 " Number of spaces to use for each step of (auto)indent
      set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
      set autoindent
      set infercase " case inferred by default, used for autocompletition in insert mode and so on..
      set t_Co=256

      set ignorecase " ignore case when searching
      set hlsearch   " highlight search matches
      set incsearch " search as you type
      set gdefault  " global matching is default
      set smartcase " use smartcase, when search query starts with Uppercase, turn off case insensitive search

      set list " show trailing characters
      set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮,nbsp:~ " it show ¬ character when as you type, fill free to comment out set list

      set number " set line numbering
      set novisualbell " do not blink
      set lazyredraw " get faster, redraw only when it's needed
      set nostartofline
      set linespace=0
      let c_no_trail_space_error = 1 " see c errors
      let java_space_errors = 1 " see java errors
      set showcmd " show the command being typed
      set ruler " always show current position
      set scrolloff=5 " Keep 5 lines (top/bottom) for scop
      set sidescrolloff=10 " Keep 10 lines at the size
      set showmode " show the current mode (Insert, Visual..)

      set expandtab " no real tabs!
      set wrap " wrap lines, we dont want long lines
      set showbreak=↪ " character show when wrapping line

      set nofoldenable " dont show folds by default; folding text into clusters (+) according to  {{{ }}} or comments for example
      set foldmethod=syntax " default options, we create fold manually.
      set showmatch " when use insert bracket, briefly jump to matching one (i like it, but i might be annoying)

      set infercase " case inferred by default
      set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
      set shiftwidth=2 " auto-indent amount when using >> <<
      set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
      set tabstop=4 " real tabs should be 4, and they will show with set list on

      set completeopt=longest,menu,preview

      " configure cursor for temrinal
      " color
"      if &term =~ "xterm\\|rxvt"
        "" use an orange cursor in insert mode
        ""let &t_SI = "\<Esc>]12;orange\x7"
        "" use a red cursor otherwise
        ""let &t_EI = "\<Esc>]12;red\x7"
        ""silent !echo -ne "\003]12;gray\007"
        "" reset cursor when vim exits
        ""autocmd VimLeave * silent !echo -ne "\033]112\007"
        "" use \003]12;gray\007 for gnome-terminal
      "endif

      """ shape
      "if &term =~ '^xterm'
        "" solid underscore
        "let &t_SI .= "\<Esc>[4 q"
        "" solid block
        "let &t_EI .= "\<Esc>[2 q"
        "" 1 or 0 -> blinking block
        "" 3 -> blinking underscore
        "" Recent versions of xterm (282 or above) also support
        "" 5 -> blinking vertical bar
        "" 6 -> solid vertical bar
"      endif

      " if we run gnome-terminal, use gconf tool
"      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
      "au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      "au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

    " }}}

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
        if !&binary && &filetype != 'diff'
          normal mz
          normal Hmy
          %s/^\s\+$//e
          normal 'yz<CR>
          normal `z
        endif
      endfunction

      " Filter and trim whitespaces
      autocmd FileWritePre * :call TrimWhiteSpace()
      autocmd FileAppendPre * :call TrimWhiteSpace()
      autocmd FilterWritePre * :call TrimWhiteSpace()
      autocmd BufWritePre * :call TrimWhiteSpace()

      " Use relative numbering in insert mode
      autocmd InsertEnter * :set relativenumber
      autocmd InsertLeave * :set number

    "}}}

    " Binding
    " {{{
    " Map leader
      let mapleader = ',' " used for lot of stuff, feel free to change it.

      " Open all folds
      nnoremap <space> :%foldopen<CR>

      " Toggle one fold
      nnoremap f za

      " Toggle all folds
      nnoremap F zA

      " convenient window switching
      map <C-h> <C-w>j
      map <C-j> <C-w>k
      map <C-k> <C-w>i
      map <C-l> <C-w>l

      map <M-Left> <C-w><Left>
      map <M-Right> <C-w><Right>
      map <M-Up> <C-w><Up>
      map <M-Down> <C-w><Down>

      " Emacs-like keybindings
      cnoremap <C-a> <Home>
      cnoremap <C-e> <End>
      inoremap <C-a> <Esc>^i
      inoremap <C-e> <Esc>A

      " Save like a pro (CTRL+s)
      nnoremap <c-s> :w<cr>

      " Quit like a pro
      nnoremap <leader>q :q<CR>

      " open vertical split and switch to it
      nnoremap <leader>v <C-w>v<C-w>l

      " open horizontal  split and switch to it
      nnoremap <leader>h :split<CR>

      " tabs - moving around, (CTRL+n to new tab)
      map <C-t> :tabnew<CR>
      map <leader>t :tabnew<CR>
      map <M-S-Right> :tabnext<cr>
      map <M-S-Left> :tabprevious<cr>

      " buffers - moving around
      map <A-x-Left> :bprevious<CR>
      map <A-x-Right> :bNext<CR>

      " Write and quit current buffer
      nnoremap <C-M-w> :wq<CR>

      " run ctags silently
      map <leader>ct :silent! ctags -R . &> /dev/null<CR>
      " au BufWritePost *.* silent! !ctags -R  &> /dev/null &

      " copy from clipboard with ease (<leader>p => paste what you copied by CTRL+c in clipboard)
      nnoremap <leader>p "+p
      nnoremap <leader>y "+yy

      " start ack search, (using ACK tool, like grep but for source code)
      nnoremap <leader>a :Ack 

      " reformat whole file
      nnoremap <leader>= ggVG=

      " use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
      " (it will prompt for sudo password when writing)
      cmap w!! %!sudo tee > /dev/null %

      " cd to the directory containing the file in the buffer
      nmap <silent> <leader>cd :lcd %:h<CR>

      " Create the directory containing the file in the buffer
      nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

      " Better identation (do not lose focus)
      vnoremap < <gv 
      vnoremap > >gv

      " Swap two words
      nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

      " Map the arrow keys to be based on display lines, not physical lines
      map <Down> gj
      map <Up> gk


      " Toggle hlsearch with <leader><space>
      nmap <leader><space> :set hlsearch! hlsearch?<CR>

      " Map Alt-# to switch tabs
      map  <M-0> 0gt
      imap <M-0> <Esc>0gt
      map  <M-1> 1gt
      imap <M-1> <Esc>1gt
      map  <M-2> 2gt
      imap <M-2> <Esc>2gt
      map  <M-3> 3gt
      imap <M-3> <Esc>3gt
      map  <M-4> 4gt
      imap <M-4> <Esc>4gt
      map  <M-5> 5gt
      imap <M-5> <Esc>5gt
      map  <M-6> 6gt
      imap <M-6> <Esc>6gt
      map  <M-7> 7gt
      imap <M-7> <Esc>7gt
      map  <M-8> 8gt
      imap <M-8> <Esc>8gt
      map  <M-9> 9gt
      imap <M-9> <Esc>9gt
   " }}}

    " Filetypes
    " {{{

      " HTML, XML {{{
      augroup FTHtml
        au!
        autocmd FileType html,xhtml,wml,cf      setlocal ai et sta sw=2 sts=2 " set indent size and stuff
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
      " }}}

      " }}}
      " Ruby {{{
      augroup FTRuby
        au!
        autocmd FileType eruby,yaml,ruby        setlocal ai et sta sw=2 sts=2
        autocmd BufNewFile,BufRead *.html.erb   set filetype=eruby.html  " load html snippets along with erb
        autocmd FileType ruby,eruby             let g:rubycomplete_rails=1
        autocmd FileType ruby,eruby             let g:rubycomplete_classes_in_global=1
        autocmd FileType ruby,eruby             let g:rubycomplete_buffer_loading = 1
        autocmd FileType ruby,eruby             set foldmethod=manual
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

      " Git {{{
      augroup FTGit
        au!
        autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
        autocmd FileType gitcommit setlocal spell
      augroup END
      " }}}
      "


    " }}}

    " Plugins
    " {{{

      " Clang 
      " {{{
      let g:clang_use_library=1
      let g:clang_library_path="/usr/lib/"
      let g:clang_periodic_quickfix=1 " update quickfix periodically
      " }}}

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
      "

      " vim-tags
      " {{{
      let g:vim_tags_auto_generate = 1
      let g:vim_tags_use_vim_dispatch = 1
      let g:vim_tags_directories = ['.tags'] " if tags directory exists, put tags there

      let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']

      " }}}

      " Statusline (vim-powerline)
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
      let g:Powerline_symbols = 'fancy'
      " }}}

      " CtrlP
      " {{{
      set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
      nnoremap <F3> :CtrlP<CR>
      nnoremap <F4> :CtrlPBuffer<CR>
      nnoremap <F5> :CtrlPTag<CR>
      nnoremap <F2> :CtrlPDir<CR>
      let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$'
            \ }

      map <leader>f :CtrlP<cr>
      map <leader>b :CtrlPMRU<cr>
      map <leader>cv :CtrlP app/views<cr>
      map <leader>cc :CtrlP app/controllers<cr>
      map <leader>cm :CtrlP app/models<cr>
      " }}}

      " Gist
      " {{{
      let g:gist_clip_command = 'xclip -selection clipboard'
      let g:gist_detect_filetype = 1
      let g:gist_open_browser_after_post = 1
      let g:gist_browser_command = 'google-chrome %URL% &' " NOTE: use your browser!
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
      let g:ruby_debugger_debug_mode=1
      let g:ruby_debugger_builtin_sender = 0
      " }}}

      " Gundo {{{
      nnoremap <leader>gu :GundoToggle<CR>
      " }}}

      " Fugitive {{{
      nnoremap <leader>gs :Gstatus<cr>
      nnoremap <leader>gc :Gcommit 
      nnoremap <leader>gd :Gdiff<cr>
      " }}}

      " NERDTree {{{
      nnoremap <F1> :NERDTreeToggle<CR>
      let g:NERDTreeMinimalUI=1
      let g:NERDTreeDirArrows=1
      let g:NERTreeHighlightCursorLine=1
      "}}}
      "
      " NerdTree Tabs {{{
      nnoremap <C-F1> :NERDTreeTabsToggle<CR>
      let g:nerdtree_tabs_open_on_gui_startup=0
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

      nnoremap <leader>ra :Rails 
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
      set showtabline=1   " show tabs in gvim, not vim
      set guitablabel=%t  " show simple filname as tabname

      " Bindings
      " {{{
      nnoremap <c-o> :browse tabnew :pwd<CR>
      nnoremap <C-M-s> :browse saveas :pwd<CR>
      nnoremap <C-M-w> :wq<CR>
      nnoremap <C-M-f> :set guifont=*<CR>
      " }}}
    endif
    " }}}
" }}}
