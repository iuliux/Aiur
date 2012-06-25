set nocompatible

inoremap jj <Esc>


" Keep at least 5 lines around the cursor
set scrolloff=5


" Isolate temp and backup files
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp


" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full


" Enable mouse support in console
set mouse=a
" Line Numbers
set number


" Ignoring case in commands
set ignorecase
" Smart case on search
set smartcase
set incsearch


" Highlight all occurences of the word under cursor
highlight flicker cterm=bold ctermfg=white
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'


" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


" Tab navigation mappings
:nmap <S-Left> :tabprevious<cr>
:nmap <S-Right> :tabnext<cr>
:imap <S-Left> <ESC>:tabprevious<cr>i
:imap <S-Right> <ESC>:tabnext<cr>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>i
:map <C-w> :tabclose<cr>


" Typos autofix
iab slef self
