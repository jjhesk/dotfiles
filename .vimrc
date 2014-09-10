"enable vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bitc/vim-hdevtools'
Plugin 'gerw/vim-latex-suite'
Plugin 'morhetz/gruvbox'

call vundle#end()

"remap j and k to be visual lines and not literal lines
noremap j gj
noremap k gk

"remap alt+j to do what shift+j was meant to do (join lines)
"won't work on non-mac machines
nnoremap ∆ J

"remap shift J/K for in vim tab switching
nnoremap J gT
nnoremap K gt

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

"custom rPeANUt highlighting
au BufRead,BufNewFile *.s set filetype=rpn
au! Syntax rpn source ~/Documents/rpn.vim

"custom LTS highlighting
au BufRead,BufNewFile *.lts set filetype=lts
au! Syntax lts source ~/Documents/lts.vim

"recognise *.md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufEnter *.md set spell

"color scheme settings
autocmd BufEnter * color smyck
autocmd BufEnter *.tex color gruvbox
autocmd BufEnter *.tex set bg=dark

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
set textwidth=79
set formatoptions+=want

"allow alternate interpretations of files using " vim: set
set modeline
