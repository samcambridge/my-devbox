set nocompatible " required
filetype on     " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

call vundle#end()

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'zivyangll/git-blame.vim'
call plug#end()

map — :NERDTreeToggle<CR>
map ] :NERDTreeFind<CR>

filetype plugin indent on    " required
filetype indent on    " required

set number
syntax on
set t_Co=256
set cursorline
" colorscheme onehalfdark

let mapleader = ","
nmap <leader>r :NERDTreeFind<cr>
nmap <leader>n :NERDTreeToggle<cr>

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

nnoremap <silent> <C-z> :FZF<CR>

let g:NERDTreeHijackNetrw=0

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

inoremap kj <Esc>
autocmd BufWritePre * :call TrimWhitespace()
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
