#! /bin/bash

CURR_DIR="`pwd`"

APPS_LIST="git "
APPS_LIST+="zsh "
APPS_LIST+="tmux "
APPS_LIST+="curl "

#echo "DEBUG: current dir is $CURR_DIR"
#echo "DEBUG: current application list is $APPS_LIST"

# install dependent applications
apt-get install $APPS_LIST -y

# back current ~/.bashrc and link
if [ -e ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc_bk
fi
ln -s $CURR_DIR/.bashrc ~/.bashrc

# colors setting
ln -s $CURR_DIR/.dir_colors ~/.dir_colors

# bash alias
ln -s $CURR_DIR/.bash_aliases ~/.bash_aliases

# inputrc
ln -s $CURR_DIR/.inputrc ~/.inputrc

# tmux.conf
ln -s $CURR_DIR/.tmux.conf ~/.tmux.conf

# vim setting
ln -s $CURR_DIR/.vimrc ~/.vimrc
ln -s $CURR_DIR/.vim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# emacs setting
ln -s $CURR_DIR/.emacs.d ~/.emacs.d 

# install oh-my-zsh 
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# detect if running on a virtual machine
dmidecode | grep -i product
