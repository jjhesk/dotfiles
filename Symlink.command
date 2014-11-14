#!/usr/bin/env bash

p=$(pwd)

ln -s $p/.bashrc ~
ln -s $p/.gitignore_global ~
ln -s $p/.gitignore_global ~/.hgignore
ln -s $p/.hgrc ~
ln -s $p/.vimperatorrc ~
ln -s $p/.vimrc ~
