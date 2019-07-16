" By default never use tabs, only 4 spaces at a time.
set tabstop=4
set shiftwidth=4
set expandtab       " expand tabs into spaces when typing
set number          " show line numbers
set splitright      " do vertical splits on the right
"set t_Co=256        " allows 256 bit colorschemes
set hlsearch        " highlight all search matches on the page

colorscheme elflord

" Always display filename at bottom, this takes up 1 extra line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set ls=2

" F2 - Always use spaces, convert tabs to 4 spaces
noremap <F2> :set tabstop=4 shiftwidth=4 expandtab \| :echo "Using spaces (4)"<CR>

" F3 - Always use tabs, display as 4 spaces
noremap <F3> :set tabstop=4 shiftwidth=4 noexpandtab \| :echo "Using tabs (4)"<CR>

" F4 - Always use tabs, display as tabs
noremap <F4> :set tabstop=8 shiftwidth=8 noexpandtab \| :echo "Using tabs (8)"<CR>

" F5 - HTML editing, all tabs, displayed as 2 spaces
noremap <F5> :set tabstop=2 shiftwidth=2 noexpandtab \| :echo "Using tabs (2)"<CR>

" F7 = Save changes and quit
map <F7> :x<CR>
" F8 = Quit without save
map <F8> :q!<CR>

" Apply file type specific commands
if has("autocmd")
    autocmd FileType c,cpp,h,java,sh,pl	set cindent
    autocmd FileType html set tabstop=8 softtabstop=2 shiftwidth=2 noexpandtab
    autocmd FileType make set tabstop=8 sts=8 sw=8 noexpandtab
endif
