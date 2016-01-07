#!/usr/bin/env zsh

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
linkHome .config/nvim/vimrc

# window management
linkHome .xinitrc
linkHome .xmobarrc
linkHome .Xresources
linkHome .xmonad
linkHome .config/compton.conf
linkHome .urxvt


# custom scripts
linkHome .bin


# link zprezto config files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
