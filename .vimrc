set nocompatible
filetype off

" Install Vundle:
" $ git clone https://github.com/VundleVim/Vundle.vim.git \
" ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
call vundle#end()

syntax on
colorscheme molokai
filetype plugin indent on
