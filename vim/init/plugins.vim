" ----------------
"  VIM PLUGINS
" ----------------

" Plugin manager
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')

" ---------------
"  FUNCTIONAL
" ---------------

" A collection of language packs for vim
Plug 'sheerun/vim-polyglot'

" Automatic closing of quotes, parenthesis and brackets
Plug 'raimondi/delimitmate'
" Automatic closing of HTML and XML tags
Plug 'alvan/vim-closetag'

" Use fzf to look for and open files
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Bottom context line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Conquer of completion (LSP support)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Coc extensions
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}

" A scrollbar
Plug 'ojroques/nvim-scrollbar'

" Comment/uncomment lines with 'gc'+movement
Plug 'tpope/vim-commentary'

" Highlight, navigate and operate on sets of 
" matching text
Plug 'andymass/vim-matchup'


" -------------------
"  LANGUAGE-SPECIFIC
" -------------------

" Java
Plug 'uiiaoo/java-syntax.vim', {'for': ['java']}
" LaTeX
Plug 'lervag/vimtex', {'for': ['tex']}
" Rust
Plug 'rust-lang/rust.vim', {'for': ['rs']}

call plug#end()

