#!/bin/bash

CURR_DIR="`pwd`"

if [ -f ~/.bashrc ]
	mv ~/.bashrc ~/.bashrc_bk
fi
ln -s $CURR_DIR/.bashrc ~/.bashrc

ln -s $CURR_DIR/.vimrc ~/.vimrc
ln -s $CURR_DIR/.vim ~/.vim

ln -s $CURR_DIR/.emacs.d ~/.emacs.d 

