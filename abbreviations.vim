"-------------------------------------------------------------------------------
" File:         abbreviations.vim
" Maintainer:   Vikram Pawar
"
"
" This file contains auto-completion abbrevations used in vim and gvim.
" This file is sourced in from the .vimrc file.

" This file is normally stored here:
"
"       $HOME/.vim/abbreviations.vim
"
" Here is how I use the following for autocompletion:
"
"   * Abbreviations (this file) - abbreviations that are general to any file
"
"
"-------------------------------------------------------------------------------

" Auto-complete abbreviations
" ---------------------------
" Maps 2day to today's date
iab 2day <C-R>=strftime("%b %D %Y")<CR>
" Maps vp to Vikram Pawar
iab vp Vikram Pawar

iab #b /******************************************************************************
iab #e <Space>***********************************************************************/
