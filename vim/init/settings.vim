" ----------------
"  SETTINGS
" ----------------

" use mouse to resize, scroll, etc. even within tmux
set mouse+=a

" recursive within current directory
set path+=**

" use system clipboard as default
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" enable syntax
syntax enable
filetype plugin indent on


" default to UTF-8
set fileencodings=utf-8
set encoding=utf-8

" enable auto indent
set autoindent
set backspace=indent,eol,start
set complete-=i

" expand tabs to 4 spaces
set expandtab
set tabstop=4
" when using << or >> commands, shift lines by 4 spaces
set shiftwidth=4

"set relativenumber              " show line numbers
set number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set cursorcolumn        " highlight current column
hi CursorLine cterm=NONE
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " show parenthesis matching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set autoread            " autoread file changes

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" enable spell checking for English
set spell spelllang=en_us
set spellfile=$HOME/.dotfiles/words/en.utf-8.dic

" disable omnicompletion
filetype plugin on

" Show TAB and EOL characters by default
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" open splits to right and bottom
set splitbelow
set splitright

" prompt for reload when file changes
:au WinEnter * checktime


" map ctrl-t to NetRW
map <C-t> :Vexplore<CR>
" Width
let g:netrw_winsize = 25
" Tree-like style
let g:netrw_liststyle = 3
" Remove dir banner
let g:netrw_banner = 0
" Open files in new vertical split
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Format rust files on save with rustfmt
let g:rustfmt_autosave = 1
