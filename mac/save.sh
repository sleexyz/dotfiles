#!/usr/bin/env bash

DIR=$( dirname "${BASH_SOURCE[0]}" )

copyFromHome () {
  LOCAL="$HOME/$1"
  REMOTE="$DIR/$1"

  REMOTE_PARENT=$(dirname "$REMOTE")
  mkdir -p "$REMOTE_PARENT"
  echo "Saving: ~/$1"
  cp "$LOCAL" "$REMOTE"
}

copyFromHome "Library/Application Support/Code/User/settings.json"
copyFromHome ".config/nvim/init.vim"

