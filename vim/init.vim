"
" NEOVIM CONFIGURATION FILE
" By: jumpinglangur
"

" -------------------
"  GLOBAL OPTIONS
" -------------------

" not compatible with ancient versions
set nocompatible
" Leader key is space
let mapleader=" "

" -------------------
"  LOAD VIMRC FILES
" -------------------

" Init files
source $HOME/.dotfiles/vim/init/plugins.vim
source $HOME/.dotfiles/vim/init/commands.vim
source $HOME/.dotfiles/vim/init/settings.vim
source $HOME/.dotfiles/vim/init/theme.vim
source $HOME/.dotfiles/vim/init/mappings.vim
source $HOME/.dotfiles/vim/init/functions.vim
source $HOME/.dotfiles/vim/init/file-types.vim

" Plugin configuration files
source $HOME/.dotfiles/vim/init/plugin-scrollbar.vim
source $HOME/.dotfiles/vim/init/plugin-coc.vim

