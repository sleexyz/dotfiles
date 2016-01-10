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


linkHome .zprezto
linkHome .profile
linkHome .xprofile

linkHome .spacemacs


# window management
linkHome .xinitrc
linkHome .xmobarrc
linkHome .Xresources
linkHome .xmonad
linkHome .urxvt
linkHome .dircolors

mkdir -p ~/.config/nvim
mkdir -p ~/.config/gtk-3.0

linkHome .config/xsession.sh
linkHome .config/nvim/init.vim
linkHome .config/compton.conf
linkHome .config/termite
linkHome .config/gtk-3.0/gtk.css



# custom scripts
linkHome .bin


# link zprezto config files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  OUTPUT="${ZDOTDIR:-$HOME}/.${rcfile:t}"
  echo $OUTPUT
  if [ ! -f $OUTPUT ]; then
    echo "linked $OUTPUT"
    ln -s "$rcfile" "$OUTPUT"
  fi
done
