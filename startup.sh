#! /bin/bash

CURR_DIR="`pwd`"
#echo "current dir: $CURR_DIR"

# back current ~/.bashrc and link
if [ -e ~/.bashrc ]; then
	#echo ".bashrc exist"
	mv ~/.bashrc ~/.bashrc_bk
fi
ln -s $CURR_DIR/.bashrc ~/.bashrc

# colors setting
ln -s $CURR_DIR/.dir_colors ~/.dir_colors

# bash alias
ln -s $CURR_DIR/.bash_aliases ~/.bash_aliases

# inputrc
ln -s $CURR_DIR/.inputrc ~/.inputrc

# vim setting
ln -s $CURR_DIR/.vimrc ~/.vimrc
ln -s $CURR_DIR/.vim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# emacs setting
ln -s $CURR_DIR/.emacs.d ~/.emacs.d 
