#### current machine:
macbook air 13 inch

#### stuff I use:
- ranger
- *editors*
    - spacemacs
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
