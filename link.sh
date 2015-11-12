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


##### navigation
touch $HOME/.z


###### editors
# spacemacs
linkHome .spacemacs


# vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
linkHome .vimrc
_link "$DIR/.vimrc" "$HOME/.config/vim/init.vim"
mkdir -p $HOME/.config/vim
_link $HOME/.vim $HOME/.config/vim


###### window management
linkHome .amethyst


###### custom scripts
linkHome .bin
