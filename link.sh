#!/bin/bash

# A script to link dotfiles in this repo to $HOME


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# _link SOURCE DEST
_link() {
	rm -f $2
	ln -s $1 $2
}

# linkHome SOURCE
linkHome() {
	_link $DIR/$1 $HOME/$1
}

#initialize
mkdir -p $HOME/.config


# shell
linkHome .zprezto

# editors
linkHome .spacemacs
linkHome .vimrc
_link .vim ~/.config/vim
_link .vimrc ~/.config/vim/init.vim

# window management
linkHome .amethyst


# custom scripts
linkHome .bin
