" ------------------------------------------------------------------------------
" File:         key_bindings.vim
" Maintainer:   Vikram Pawar
"
" This file contains key bindings/mappings/shortcuts used in vim and gvim
" This file is sourced in from the .vimrc file.

" This file is normally stored here:
"
"   $HOME/.vim/key_bindings.vim
"
" ------------------------------------------------------------------------------


" Notes on Key Bindings:
" ---------------------
" - map is recursive (it will expand)
" - noremap is not recursive
"
" - map (noremap) is a mapping that works in all modes
" - imap (inoremap) is a mapping for insert mode
" - nmap (nnoremap) is a mapping for normal mode
" - vmap (vnoremap) is a mapping for visual mode (and select mode)
" - xmap (xnoremap) is a mapping for visual mode only

" mapleader is the precursor key used for bindings that use <leader>
let mapleader=","
let g:mapleader=","

" map CTRL-A to select all
"map <C-A> ggVG
"
" map CTRL-B to do nothing
nmap <C-b> <Nop>

" ,i auto-indents the entire file
map <leader>i 1G=G

" make Y behave like D, yanking the current line to the end of the line
nmap Y y$

" hit ; in normal mode means :, one less key to press
"nnoremap ; :

" jump to matching pairs with tab
"nnoremap <Tab> %
"vnoremap <Tab> %

" ,q quits
"nmap <leader>q :q<CR>

" ,s or ,w saves
nmap <leader>s :w!<CR>
nmap <leader>w :w!<CR>

" ,v opens the vimrc file
nmap <leader>v :vsplit $HOME/.vimrc<CR>

" ,b opens the key bindings file
nmap <leader>b :vsplit $HOME/.vim/key_bindings.vim<CR>

" ,a opens the abbreviations file
nmap <leader>a :vsplit $HOME/.vim/abbreviations.vim<CR>

" ,d marks the current line as a task that has been completed
nmap <leader>d :s/^/x <C-R>=strftime("%Y-%b-%d")<CR> /<CR> \| :nohl<CR>

" ,f formats the entire text
nmap <leader>f gqG

" ,p removes trailing whitespace from end of lines
nmap <leader>p :%s/\s\+$//<CR>

" ,t loads the template for the current file type
nmap <leader>t :silent! 0r $HOME/.vim/templates/%:e.tpl<CR> \| :%s:<filename>:<C-R>=expand("%:t")<CR>:g<CR> \| :0<CR>

" map <F1> (help) to nothing
" use :help to bring up help if needed
nmap <F1> <ESC>
imap <F1> <ESC>


" map <F6> to toggle the cursorline - useful in screen sharing
" it puts a line under the line your cursor is on
noremap <F6> :set cursorline!<CR>

" map <F10 to toggle paste mode - to prevent indenting while pasting
set pastetoggle=<F10>
