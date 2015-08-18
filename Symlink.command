#/usr/bin/env bash

p=$(pwd)

ln -s $p/.bashrc ~
ln -s $p/.gitignore_global ~
ln -s $p/.gitignore_global ~/.hgignore
ln -s $p/.hgrc ~
ln -s $p/.profile ~
ln -s $p/.pylintrc ~
ln -s $p/.vimperatorrc ~
ln -s $p/.vimrc ~

git config --global core.excludesfile ~/.gitignore_global
echo -e "source ~/.profile\nsource ~/.bashrc" >> ~/.bash_profile
