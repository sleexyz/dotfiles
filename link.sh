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


# shell
linkHome .zprezto

# editors
linkHome .spacemacs
linkHome .vimrc

# window management
# linkHome .xinitrc
# linkHome .xmobarrc
# linkHome .Xresources
# linkHome .xmonad
# linkHome .config/compton.conf
# linkHome .urxvt
linkHome .amethyst


# custom scripts
linkHome .bin
