vim.cmd [[
try
colorscheme gruvbox
"  colorscheme darkplus
" colorscheme onedarker
" colorscheme tomorrow
" colorscheme codemonkey
" colorscheme system76
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
