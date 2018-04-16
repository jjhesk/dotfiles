#/usr/bin/env bash

p=$(pwd)
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p "$XDG_CONFIG_HOME/nvim"

ln -s $p/.bashrc ~
ln -s $p/.gitignore_global ~
ln -s $p/.profile ~
ln -s $p/.pylintrc ~
ln -s $p/.vimperatorrc ~
ln -s $p/.vimrc ~
ln -s $p/init.vim "$XDG_CONFIG_HOME/nvim/init.vim"

git config --global core.excludesfile ~/.gitignore_global
echo -e "source ~/.profile\nsource ~/.bashrc" >> ~/.bash_profile
