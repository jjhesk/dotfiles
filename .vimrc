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

"set shift+tab to autocomplete word
inoremap <S-Tab> <C-n>

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
au BufRead,BufNewFile .vimperatorrc set filetype=vim

"custom highlighting
au! Syntax lts source ~/Documents/lts.vim
au! Syntax rpn source ~/Documents/rpn.vim

"pilcrow
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿

"indentation
set tabstop=8       "tab width
set shiftwidth=4    "ident width
set softtabstop=0   "columns in a tab
set expandtab       "expand tabs to spaces
set smarttab
set backspace=indent,eol,start

"remove double space after sentence end
set nojoinspaces

"allow alternate interpretations of files using " vim: set
set modeline

"enable folding
set foldmethod=syntax
set foldminlines=10

"autocommands for filetypes
au FileType gitcommit   setlocal textwidth=68 spell
au FileType markdown    setlocal textwidth=79 formatoptions+=want spell
au FileType text        setlocal textwidth=79 formatoptions+=want spell
au FileType c           setlocal textwidth=79
au FileType python      setlocal textwidth=79 foldmethod=indent

"open all folds by default
autocmd BufEnter * :normal zR

"color scheme
color gruvbox
set bg=dark

"handle paste (no auto indent)
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"let :W do the same thing as :w
command! W execute "w"
