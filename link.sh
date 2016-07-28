#!/bin/bash
#
# A script to link dotfiles in this repo to $HOME
#
# This script must be idempotent:
# aka linking it again while it is already linked is a no-op



DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


_link() {
  # WARNING: overrides target
	rm -f $2
	ln -s $1 $2
}

linkHome() {
	_link $DIR/$1 $HOME/$1
}





###### shell
linkHome .zprezto

linkRunCom () {
  _link ".zprezto/runcoms/$1" "$HOME/.$1"
}
linkRunCom zlogin
linkRunCom zlogout
linkRunCom zpreztorc
linkRunCom zprofile
linkRunCom zshenv
linkRunCom zshrc


##### navigation
touch $HOME/.z


###### editors
# spacemacs
linkHome .spacemacs


# vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
linkHome .vimrc
# mkdir -p $HOME/.config/vim
# _link "$DIR/.vimrc" "$HOME/.config/vim/init.vim"
# _link $HOME/.vim $HOME/.config/vim


###### window management
linkHome .kwm


###### custom scripts
linkHome .bin
