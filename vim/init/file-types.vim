" -----------------------
"  FILE TYPE DEFINITIONS
" -----------------------

" i3 configuration file type
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.dotfiles/i3/config set filetype=i3config
aug end

" GLSL shader file extensions: .fragment and .vertex
autocmd BufNewFile,BufRead *.fragment,*.vertex set syntax=glsl
