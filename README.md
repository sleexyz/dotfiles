# My NixOS configuration
Goal: maximize declarativeness and reproducibility (and therefore robustness) of my development system

## Installation
[Dual boot NixOS and OSX on a UEFI macbook](INSTALL.md)


## (r)icing on the cake:

- [`/etc/nixos/configuration.nix`](configuration.nix)
- [`~/.nixpkgs/config.nix`](.nixpkgs/config.nix)

### stuff I use:
- nixos
- urxvt
- ranger
- spacemacs
- neovim
- xmonad
- xmobar
- compton
- rofi
- prezto

### setup:
```
git clone https://github.com/freshdried/dotfiles ~/projects/dotfiles
cd ~/projects/dotfiles
./link.sh
```
