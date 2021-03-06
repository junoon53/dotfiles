"-------------------------------------------------------------------------------
" File:	        .vimrc
" Maintainer:   Vikram Pawar
"
" This file contains configuration settings specific to console vim only.
"
" Related files:
"	* gvimrc - settings related to gvim
"	* key_bindings.vim - key mappings/shortcuts
"	* abbrevations.vim - abbrevation definitions
"*
" To start vim without using a .vimrc file or .gvimrc file, use:
"	vim -u NONE -U NONE
"
" External addons/scripts being used (obtainable from vim.org):
"   * pathogen (for easy addon loading)
"   * snipMate (support for file-type specific auto-completion)
"   * nerdCommenter (used for easy commenting in many languages)
"   * vim-airline (powerful replacement for the status line)
"   * fugitive (lets your run git commands in vim)	
"   * ale (syntax checker)
"   * vim-surround (easily change 'surrounds' such as parentheses and quotes
"   * indent-guides (adds vertical indent lines)
"-------------------------------------------------------------------------------

" Attribution
" ----------
" Based on .vimrc created by Brandon Arrendondo


" General Options
" ---------------

"if $COLORTERM == 'gnome-terminal'
set t_Co=256
"endif

" character encoding
set encoding=utf8

" vim mode instead of vi mode
set nocompatible

" pathogen
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

" ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_python_binary_path = '/home/vikram/workspaces/anaconda2/bin/python'


" Ale (syntax checker)
" Check Python files with flake8 and pylint.
"let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
"let g:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_python_flake8_args = '--ignore=E,W,F403,F405 --select=F,C'
let g:ale_lint_on_enter = 1

" ident-guides
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" disable modelines (a form of scripting) to fix a security hole
set modelines=0

" indicates a fast terminal connection (almost always true)
set ttyfast

" buffers - sometimes annoying
"set hidden
"
" vim-powerline configuration
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'solarized256'
"let g:Powerline_colorscheme = 'solarized256'

" powerline configuration
set rtp+=$HOME/workspaces/powerline/powerline/bindings/vim/
set fillchars+=stl:\ ,stlnc:\

" vim-airline configuration
"let g:airline_detect_modified=1
"let g:airline_powerline_fonts=1
"let g:Powerline_symbols = 'simple'
"let g:airline#extensions#csv#column_display = 'Name'
"let g:airline_theme= 'simple'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

if has("win32")
    "no backup files on windows"
    set no backup
endif

" Auto-loading options
" --------------------
" automatically read a file when it is changed outside vim
set autoread

" auto reload vimrc, abbrevations, and key_bindings file
" when they are edited
autocmd! bufwritepost .vimrc source $HOME/.vimrc
autocmd! bufwritepost key_bindings.vim source $HOME/.vimrc
autocmd! bufwritepost abbrevations.vim SOURCE $HOME/.vimrc

" add json file type - the same syntax/snippets as javascript
au BufNewFile,BufRead *.json set filetype=javascript

" folding in markdown
au BufEnter *.markdown setlocal foldexpr=MarkdownLevel()
au BufEnter *.markdown setlocal foldmethod=expr

" function to restore cursor position to last position
function! ResCur()
   if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" function to restore cursor position to last position
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" auto load template on a new file for the given file type
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl

" associate .slide with .tex
au BufNewFile,BufRead *.slide set filetype=tex

" Visual Options
" --------------
set ruler

" enable relative line numbering
set rnu
set number

" visual background and colorscheme
"syntax enable
"set background=dark
"colorscheme solarized

" status line is always shown
set laststatus=2

" command line is 1 lines high
set ch=1

" don't show the current mode
set noshowmode 

" show tab characters as >.
set list 
set listchars=tab:>.

" 
set ambiwidth=single

" highlight beyond the 80th column
if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=3
else 
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Search Options
" --------------
" show matching parens/etc (for 5 ms)
set showmatch
set matchtime=5

" highlight search matches
set hlsearch

" incremental searching
set incsearch

" ignore case when searching
set ignorecase

" do not ignore case when explicitly given case
set smartcase

" Editing Options
" ---------------
" code syntax/indenting
syntax on
set autoindent
set smartindent

" tabs to spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set shiftround
"set textwidth=79

" tabs to spaces - except for makefiles
autocmd FileType make setlocal noexpandtab

" allow backspace over everything
set backspace=indent,eol,start

" give us a lot of undos
set undolevels=1000

" Loading external files
" ----------------------
source $HOME/.vim/abbreviations.vim
source $HOME/.vim/key_bindings.vim

" Vim remembering
" ---------------
" tell vim to remember:
" marks from 20 previous files
" save up to 100 lines in each register
" save up to 50 lines of command history
" saves and restores the buffer list
" and saves to ~/.viminfo
set viminfo='20,"100,:50, %,n$HOME/.viminfo

" Autocompletion options
" ----------------------
" set the dictionary - sometimes this is annoying
" set dictionary=/usr/share/dict/words
" set complete=.,w,k

" User-defined functions
" ---------------------
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction
