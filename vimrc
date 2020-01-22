" Based on a version by Bram Moolenaar <Bram@vim.org>
" With additions from many sources, Gary Berndhardt and Justin Lilly esp.
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader=','

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set scrolloff=3 " overlap on page scrolling.
set showcmd		" display incomplete commands
set showmode
set incsearch		" do incremental searching
set number  " always show line numbers
set numberwidth=4 " plus one colum space = 5 columns total.
set ttyfast       " smoother updates
set nostartofline   " don't jump to start of line when scrolling.

" Don't use Ex mode, use Q to go to end of line.
map Q g$

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78 wrapmargin=10

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " set colorcolumn=50,80,100
  autocmd BufRead,BufNewFile *.py setlocal colorcolumn=50,72,80,100
  augroup END

endif " has("autocmd")

set autoindent showmatch
syntax off " I hate highlighting, at least until I get decent colors...
highlight LineNr term=bold
set equalprg=fmt
set nosol  " Keep from undong horizontal scrolling
" set nowrap " Needed for horizontal scrolling
set nowrapscan		" do not wrap on searches
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2 "Always a status line, please.
":set statusline=%<%-6([%M%R]%)%-19(%5l,%03c\ %2p%%%)#%o/%O'%03b/%03B%=[%M%R]\ %f
":set statusline=%<%f%=[%M%R]\ %-19(%04l,%03c\ %p%%%)#%o/%O'%03b/%03B
:set statusline=%<%f\ %([%M%R]%)%=%-19(%04l,%03c\ %p%%%)#%o/%O'%03b/%03B
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
set expandtab
:set cmdheight=2
set wildmode=longest,list
set background=light " I run with a white background.
set foldmethod=indent
" turned off foldenable
" turning it on seemed like a good idea, but it was just getting in the way
set nofoldenable
map <leader>, :w:n
"tired of invoking fmt by accident because of shift key delay
map ; :
" map ; !}fmt -l 0 -70
" map ; :!rm %,n

" From vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/"  <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

let g:clj_highlight_builtins=1 " Clojurebuiltins

abbrev cl client
abbrev ct context
abbrev hl helper
abbrev ri response_info
abbrev RI ResponseInfo
abbrev rs responses
abbrev RL ResponseList
