#! /bin/bash

CURR_DIR="`pwd`"
#echo "current dir: $CURR_DIR"

if [ -e ~/.bashrc ]; then
	#echo ".bashrc exist"
	mv ~/.bashrc ~/.bashrc_bk
fi
ln -s $CURR_DIR/.bashrc ~/.bashrc

ln -s $CURR_DIR/.dir_colors ~/.dir_colors

ln -s $CURR_DIR/.bash_aliases ~/.bash_aliases

ln -s $CURR_DIR/.vimrc ~/.vimrc
ln -s $CURR_DIR/.vim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

ln -s $CURR_DIR/.emacs.d ~/.emacs.d 
