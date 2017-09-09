"enable vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" MUST-HAVE PLUGINS
Plugin 'godlygeek/csapprox'  " This fixes vim colour schemes in OSX Terminal
Plugin 'morhetz/gruvbox'     " Best colour scheme hands down
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" QUALITY OF LIFE PLUGINS
Plugin 'benekastah/neomake'  " Asynchronous linting

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

"faster word movement
noremap W 5w
noremap B 5b
noremap E 5e

"remap Y to be copy to clipboard
noremap Y "+y

"disable annoying ZZ save and exit vim
nnoremap ZZ <nop>

"space to toggle fold
nnoremap <Space> za

"set shift+tab to autocomplete word
inoremap <S-Tab> <C-n>

"set zs to select first option in spell and correct all occurences
noremap zs z=1<Enter><Enter>

"enable auto indenting
set ai

"ignore case if search term is all lowercase
set ignorecase smartcase
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
au BufRead,BufNewFile *.md  set filetype=markdown
au BufRead,BufNewFile .vimperatorrc set filetype=vim

"pilcrow
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿

"indentation
set tabstop=4       "tab width
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
au FileType markdown    setlocal spell
au FileType text        setlocal textwidth=79 formatoptions+=want spell
au FileType c           setlocal textwidth=79
au FileType python      setlocal textwidth=79 foldmethod=indent

"run Neomake after each write
autocmd! BufWritePost * Neomake

"enable mouse (in neovim)
set mouse=a

"none of that fake english
set spelllang=en_au

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

"let :Q do the same thing as :q
command! Q execute "q"

" Clean whitespace
function! Clean()
    %s/\s\+$//
endfunction

" Delete duplicate lines
function! NoDups()
    g/^/m0
    g/^\(.*\)\ze\n\%(.*\n\)*\1$/d
    g/^/m0
endfunction

function! ShowDups() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% ShowDups <line1>,<line2>call ShowDups()

" Enable fenced code block syntax in markdown documents
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" When writing, automatically create directories if they don't exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
