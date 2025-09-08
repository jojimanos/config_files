" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" turn hybrid line numbers off
" set nonumber norelativenumber
" set nonu nornu

" toggle hybrid line numbers
" set number! relativenumber!
" set nu! rnu!

" =========================
" Vim config for writing
" =========================

" Enable line wrapping and wrap at word boundaries
set wrap
set linebreak

" Show wrapped lines with indentation
set breakindent

" Don’t show $ or ^ at line breaks
set nolist

" Text width for auto line breaks
set textwidth=80
set formatoptions=tcqrn1

" Enable spell checking
set spell

" Use relative number for easier movement
set relativenumber
set number

" Better backspace (delete over indentation, EOL, and start of insert)
set backspace=indent,eol,start

" Highlight current line for focus
set cursorline

" Disable swap files (less distraction for writing)
set noswapfile

" Enable persistent undo (like Word’s undo history)
set undofile
set undodir=~/.vim/undo

" Map shortcuts for convenience
" F5 toggles spell checking
nnoremap <F5> :setlocal spell! spell?<CR>

" F6 formats current paragraph (like reflow in Word)
nnoremap <F6> gqap
