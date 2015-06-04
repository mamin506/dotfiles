System setting sync
==================

This is Min's Vim/Emacs/Bash configuration

The startup.sh do this things.
  1. backup origin .bashrc (mv ~/.bashrc ~/.bashrc\_bk)
  2. create a symbolic link ~/.bashrc -> current\_dir/.bashrc
  3. create a symbolic link ~/.dir\_colors -> current\_dir/.dir\_colors
  4. create a symbolic link ~/.vimrc -> current\_dir/.vimrc
  5. create a symbolic link ~/.vim -> current\_dir/.vim
  6. clone Vundle repo to ~/.vim/bundle/Vundle.vim (*Make sure you installed git*)
  7. install plugin
  8. create a symbolic link ~/.emacs.d -> current\_dir/.emacs.d
  9. install oh-my-zsh

