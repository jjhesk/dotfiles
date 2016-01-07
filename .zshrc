#enable zsh syntax highlighting
source $(brew --prefix | sed -n 2p)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Ctrl+R = reverse history search
bindkey "^R" history-incremental-search-backward

#fasd aliases (fasd enabled from presto plugins)
alias ff="fasd -f"
alias vv='fasd -fe vim'
