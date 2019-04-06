set nocompatible
filetype off

" Install Vundle:
" $ git clone https://github.com/VundleVim/Vundle.vim.git \
" ~/.vim/bundle/Vundle.vim
"
" Install all plugins:
" $ vim +PluginInstall +qall

set rtp+=~/.vim/bundle/Vundle.vim    " Set the runtime path to include Vundle and initialize.
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'        " Let Vundle manage Vundle, required.
Plugin 'bling/vim-airline'           " Lean & mean status/tabline for vim that's light as air.
Plugin 'antoyo/vim-licenses'         " Vim Plugin that Provides Commands to Add Licenses at the Top of the Buffer.
Plugin 'breard-r/vim-dnsserial'      " Another DNS-zone serial number updater.
Plugin 'sjl/badwolf'                 " A Vim color scheme.
Plugin 'rust-lang/rust.vim'          " Vim configuration for Rust.
call vundle#end()


syntax on           " Enable syntax highlighting.
colorscheme badwolf " Select the theme.


filetype plugin indent on " Load the plugin and indent file depending on the file type.
set expandtab             " Use spaces instead of tabs.
set tabstop=8             " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4         " Number of spaces that a <Tab> counts for while performing editing operations.
set shiftwidth=4          " Number of spaces to use for each step of (auto)indent.


set laststatus=2 " Always display the status line.
set number       " Show line numbers.
set cursorline   " Highlight current line
set wildmenu     " Visual autocomplete for command menu
set lazyredraw   " Redraw only when we need to.
set showmatch    " Highlight matching [{()}]


set incsearch  " Search as characters are entered.
set hlsearch   " Highlight matches.
" Turn off search highlight with <leader><space>.
nnoremap <leader><space> :nohlsearch<CR>


" Move vertically by visual line.
nnoremap j gj
nnoremap k gk


" Fix a rendering issue with terminals without the bce capability
" https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
let &t_ut=''


" Licenses
let g:licenses_copyright_holders_name = $USER_NICKNAME
let g:licenses_authors_name = $USER_NICKNAME
let g:licenses_default_commands = ['affero', 'apache', 'bsd3', 'cecill', 'gfdl', 'gpl', 'gplv2', 'isc', 'lgpl', 'mit', 'mpl', 'verbatim']

" Line number modes
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
