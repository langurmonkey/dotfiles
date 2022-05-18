" ----------------
"  MAPPINGS
" ----------------

" Buffers
map <C-c> :bd<CR>

" Tabs
map <A-Left> :tabprevious<CR>
map <C-u> :tabprevious<CR>
map <A-Right> :tabnext<CR>
map <C-i> :tabnext<CR>
map <A-n> <Esc>:tabnew<CR>
map <A-c> :tabclose<CR>
" New tab from current buffer
map <leader>tt :tabedit %<CR>
" Exit to space+q
map <leader>q :q<CR>

" Splits
map <C-s> :vsplit<CR>
map <A-s> :split<CR>
" Map ctr-movement to move across splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" resize
noremap <A-h> :vertical resize -5<CR>
noremap <A-l> :vertical resize +5<CR>
noremap <A-j> :resize -5<CR>
noremap <A-k> :resize +5<CR>

" Fzf
map <C-p> :Files<CR>
map gb :Buffers<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


" Double space saves buffer
nnoremap <leader><leader> :w<cr>

" Center view on the search result
noremap n nzz
noremap N Nzz

" Remap control-enter to open files in new tab
nmap <silent> <C-CR> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>
