#!/usr/bin/env zsh

# A script to link dotfiles in this repo to $HOME


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# _link SOURCE DEST
_link() {
  rm -f $2
  ln -s $1 $2
  echo "updated $2"
}
# linkHome SOURCE
linkHome() {
  _link $DIR/$1 $HOME/$1
}

# mkdirP DIR
mkdirP() {
  if [ ! -d "$1" ]; then
    echo "created $1"
    mkdir -p "$1"
  else
    echo "already exists: $1"
  fi
}



echo "\n...linking dotfiles...\n"

linkHome .profile
linkHome .xprofile

linkHome .spacemacs


linkHome .xinitrc
linkHome .xmobarrc
linkHome .Xresources
linkHome .xmonad
linkHome .urxvt
linkHome .dircolors


echo "\n...linking ~/.config files...\n"

mkdirP ~/.config/nvim
mkdirP ~/.config/gtk-3.0

linkHome .config/xsession.sh
linkHome .config/nvim/init.vim
linkHome .config/compton.conf
linkHome .config/termite
linkHome .config/gtk-3.0/gtk.css



echo "\n...linking scripts...\n"
linkHome .bin



echo "\n...linking .zprezto files...\n"

linkHome .zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  OUTPUT="${ZDOTDIR:-$HOME}/.${rcfile:t}"
  if [ ! -f "$OUTPUT" ]; then
    echo "copying $OUTPUT"
    ln -s "$rcfile" "$OUTPUT"
  else
    echo "already copied to \$HOME: $OUTPUT"
  fi
done
