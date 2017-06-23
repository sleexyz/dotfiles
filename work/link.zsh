#!/usr/bin/env zsh

# link.zsh
# A script to link dotfiles in this repo to $HOME
#
# This script's execution must be idempotent


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

_link() { rm -f $2; ln -s $1 $2}

linkHome() { _link $DIR/$1 $HOME/$1 }

installVim() {
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/tmp
  linkHome .config/nvim/init.vim

  if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

installZsh() {
  if [ -d ~/.zprezto ]; then
    (cd ~/.zprezto ; git pull && git submodule update --init --recursive)
  else
    git clone --recursive https://github.com/sorin-ionescu/prezto ~/.zprezto
  fi
  linkHome .zlogin
  linkHome .zlogout
  linkHome .zpreztorc
  linkHome .zprofile
  linkHome .zshenv
  linkHome .zshrc
}

set -v

git submodule update --init --recursive

installVim
installZsh
linkHome .agda
linkHome .bin
linkHome .dircolors
linkHome .nixpkgs
linkHome .npmrc
linkHome .profile
linkHome .spacemacs && linkHome .spacemacs-layers
linkHome .tmux.conf
linkHome .xinitrc
linkHome .xmobarrc
linkHome .xmonad
linkHome .xprofile
linkHome .Xresources

mkdir -p ~/.config 
linkHome .config/xsession.sh 
linkHome .config/compton.conf 
linkHome .config/termite

mkdir -p ~/.config/gtk-3.0
linkHome .config/gtk-3.0/gtk.css 

mkdir -p ~/.ghc
linkHome .ghc/ghci.conf
