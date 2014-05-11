"remap j and k to be visual lines and not literal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"disable annoying ZZ save and exit vim
nnoremap ZZ <nop>

"enable auto indenting
set ai

"highlight last searched term
set hlsearch

"show the ruler, i.e. line and char count
set ruler
"show amount of selected lines in visual mode
set showcmd

"use the file type plugins
filetype plugin indent on

"enable syntax highlighting
syntax on
"custom rPeANUt highlighting
au BufRead,BufNewFile *.s set filetype=rpn
au! Syntax rpn source ~/Documents/rpn.vim

"recognise *.md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"allow alternate interpretations of files using " vim: set
set modeline
set modelines=3
