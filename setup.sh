#! /bin/bash --

# Get home directory path
eval home_dir=~

# Get current directory
CURR_DIR=$(pwd)

# Get dotfile directory and go to the directory
DOTFILE_DIR="$(readlink -f $(dirname "${BASH_SOURCE}"))"
cd $DOTFILE_DIR

apt_install() {
    echo "*** $2"
    sudo apt install -y $1
}

install_pkg() {
    # For Ubuntu
    apt_install $1 $2
}

install_pkg_all() {
    echo "** Install necessary packages"
    install_pkg git                 "Installing git"
    install_pkg vim                 "Installing vim"
    install_pkg tmux                "Installing TMUX"
    install_pkg curl                "Installing curl"
    install_pkg zsh                 "Installing zsh"
    install_pkg exuberant-ctags     "Installing exuberant-ctags"
}

symlink() {
    dst=${2}/${1}
    src=${3}/${1}
    if [ -e "$dst" ]; then
        echo "*** Backup $dst as ${dst}_bk"
        mv $dst ${dst}_bk
    fi
    ln -s $src $dst
}

symlink_all() {
    echo "** Create symlink at $home_dir directory"
    symlink .bashrc         $home_dir $DOTFILE_DIR
    symlink .dir_colors     $home_dir $DOTFILE_DIR
    symlink .bash_aliases   $home_dir $DOTFILE_DIR
    symlink .tmux.conf      $home_dir $DOTFILE_DIR
    symlink .vimrc          $home_dir $DOTFILE_DIR
    symlink .vim            $home_dir $DOTFILE_DIR
    symlink .emacs.d        $home_dir $DOTFILE_DIR
}

install_pkg_all
symlink_all

# install vim plugin
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# install oh-my-zsh 
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## detect if running on a virtual machine
#dmidecode | grep -i product

