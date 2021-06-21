" not compatible with ancient versions
set nocompatible
" Leader key is comma
let mapleader=" "

" PLUGINS
"
" Plugin manager
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
    Plug 'alvan/vim-closetag'
    Plug 'mcchrish/nnn.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'raimondi/delimitmate'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ervandew/supertab'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release'}
    Plug 'ojroques/vim-scrollstatus'
    Plug 'lervag/vimtex'
    Plug 'tpope/vim-commentary'
call plug#end()
        
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

" shader extensions
autocmd BufNewFile,BufRead *.fragment,*.vertex set syntax=glsl

" color scheme
colorscheme gruvbox
set background=dark

" default to UTF-8
set fileencodings=utf-8
set encoding=utf-8

" enable auto indent
set autoindent

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

set spell spelllang=en_us

" disable omnicompletion
filetype plugin on

" NNN
" Disable default mappings
let g:nnn#set_default_mappings = 0
" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" leader+n starts in current dir
nnoremap <leader>n :NnnPicker %:p:h<CR>
" actions
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
let g:nnn#command = 'nnn -d'

" Buffers
map <C-c> :bd<CR>

" Tabs
map <A-Left> :tabprevious<CR>
map <C-u> :tabprevious<CR>
map <A-Right> :tabnext<CR>
map <C-i> :tabnext<CR>
map <A-n> <Esc>:tabnew<CR>
map <A-c> :tabclose<CR>
" new tab from current buffer
map <leader>tt :tabedit %<CR>
" exit to space+q
map <leader>q :q<CR>

" Splits
map <C-s> :vsplit<CR>
map <A-s> :split<CR>
" map ctr-movement to move across splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" resize
noremap <A-h> :vertical resize -5<CR>
noremap <A-l> :vertical resize +5<CR>
noremap <A-j> :resize -5<CR>
noremap <A-k> :resize +5<CR>

" fzf
map <C-p> :Files<CR>
map gb :Buffers<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


" open splits to right and bottom
set splitbelow
set splitright

" double space saves buffer
nnoremap <leader><leader> :w<cr>

" prompt for reload when file changes
:au WinEnter * checktime

" center view on the search result
noremap n nzz
noremap N Nzz



" show tab numbers
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
endfunction

"
" NetRW configuration
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

" remap control-enter to open files in new tab
nmap <silent> <C-CR> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.dotfiles/i3/config set filetype=i3config
aug end

"
" Airline
"
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
" scrollbar in airline
let g:airline_section_x = '%{ScrollStatus()}'
let g:scrollstatus_size = 20
let g:scrollstatus_symbol_track = '─'
let g:scrollstatus_symbol_bar = '█'
