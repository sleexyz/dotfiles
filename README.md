#### current machine:
- macbook air 13 inch
- asus chromebook flip

#### stuff I use:
- osx
 - Terminal.app
 - [ranger.py](http://ranger.nongnu.org/), a vi-keys console file manager
 - [BetterTouchTool](http://www.bettertouchtool.net) to fix keyboard shortcut kinks
 - [super-easy-move-resize](https://github.com/freshdried/super-easy-move-resize.git) for XMonad-style floating-window mouse interaction
- chromebook
 - TODO: populate
- *editors*
    - [spacemacs](https://github.com/syl20bnr/spacemacs)
    - vim

## setup:
```
git clone https://github.com/freshdried/dotfiles
cd dotfiles
git submodules update --init --recursive
./link.sh

# setup spacemacs
git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d

# setup vim
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```


## todo:
- make supercollider spacemacs layer
