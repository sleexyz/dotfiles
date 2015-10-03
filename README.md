#### current development machine:
macbook air 13 inch

#### stuff I use:
- **terminal**
  - [iterm2](https://www.iterm2.com), a Terminal.app replacement
  - [ranger.py](http://ranger.nongnu.org/), a vi-keys console file manager
  - [z](https://github.com/rupa/z), a directory jumper based on frecency
  - [prezto](https://github.com/sorin-ionescu/prezto), a zsh config framework

- *window management*
  - [Amethyst](https://github.com/ianyh/Amethyst), an OSX "port" of XMonad
  - [super-easy-move-resize](https://github.com/sleep/super-easy-move-resize.git), for XMonad-style floating-window mouse interaction
  - [hyperswitch](https://bahoom.com/hyperswitch)

- *editors*
  - [spacemacs](https://github.com/syl20bnr/spacemacs): emacs X vim
  - vim

## setup:
```
git clone https://github.com/sleep/dotfiles
cd dotfiles
git submodules update --init --recursive
./link.sh


# setup spacemacs
git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d


# setup vim
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# setup z
touch $HOME/.z
```
