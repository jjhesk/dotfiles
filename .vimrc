"enable vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bitc/vim-hdevtools'
Plugin 'gerw/vim-latex-suite'
Plugin 'noah/vim256-color'

call vundle#end()

"remap j and k to be visual lines and not literal lines
noremap j gj
noremap k gk

"remap alt+j to do what shift+j was meant to do (join lines)
"won't work on non-mac machines
noremap ∆ J

"remap shift J/K for in vim tab switching
noremap J gT
noremap K gt

"remap Y to be copy to clipboard
noremap Y "+y

"disable annoying ZZ save and exit vim
nnoremap ZZ <nop>

"space to toggle fold
nnoremap <Space> za

"enable auto indenting
set ai

"highlight last searched term
set hlsearch

"show the ruler, i.e. line and char count
set nu
set ruler
"show amount of selected lines in visual mode
set showcmd

"show as much of the last line as possible (no @s)
set display+=lastline

"use the file type plugins
filetype plugin indent on

"enable syntax highlighting
syntax on

"extra file types
au BufRead,BufNewFile *.s   set filetype=rpn
au BufRead,BufNewFile *.lts set filetype=lts
au BufRead,BufNewFile *.md  set filetype=markdown

"custom highlighting
au! Syntax lts source ~/Documents/lts.vim
au! Syntax rpn source ~/Documents/rpn.vim

au FileType markdown    setlocal spell
au FileType gitcommit   setlocal spell tw=68

"pilcrow
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿

"expand tab to spaces
set expandtab
set smarttab
set softtabstop=0
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"wrap lines at 80 characters
"set textwidth=79
"set formatoptions+=want

au BufRead,BufNewFile *.c, *.md, *.py setlocal textwidth=78

"remove double space after sentence end
set nojoinspaces

"allow alternate interpretations of files using " vim: set
set modeline

"enable folding
set foldmethod=syntax
set foldlevel=1
set foldminlines=10

"color scheme
color gruvbox
set bg=dark
