vim.g.material_style = "oceanic"

vim.cmd [[
try
  colorscheme material
" colorscheme gruvbox
" colorscheme darkplus
" colorscheme onedarker
" colorscheme tomorrow
" colorscheme system76
" colorscheme codemonkey
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
