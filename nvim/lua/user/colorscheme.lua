-- Load onedark theme
--local od = require('onedark');
--od.load();

vim.cmd [[
try
colorscheme catppuccin-frappe
" colorscheme onedark
" colorscheme material
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


