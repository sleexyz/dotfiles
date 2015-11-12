#### current development machine:
macbook air 13 inch

#### stuff I use:
- **terminal**
  - [iterm2](https://www.iterm2.com) Terminal.app replacement
  - [ranger.py](http://ranger.nongnu.org/) vi-keys console file manager
  - [z](https://github.com/rupa/z) directory jumper
  - [prezto](https://github.com/sorin-ionescu/prezto) zsh config framework

- *window management*
  - [Amethyst](https://github.com/ianyh/Amethyst) OSX port of XMonad
  - [super-easy-move-resize](https://github.com/sleep/super-easy-move-resize.git) XMonad-style floating-window mouse interaction
  - [hyperswitch](https://bahoom.com/hyperswitch)

- *editors*
  - [spacemacs](https://github.com/syl20bnr/spacemacs) if emacs and vim had a baby
  - [neovim](https://github.com/neovim/neovim)
   - [spacemacs bindings for vim](https://github.com/jimmay5469/vim-spacemacs)

## setup:
```
git clone https://github.com/sleep/dotfiles
cd dotfiles
git submodules update --init --recursive
./link.sh
```


## additional setup
For spacemacs:
```
git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d
```
