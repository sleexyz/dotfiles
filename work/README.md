# My NixOS configuration
Goal: maximize declarativeness and reproducibility (and therefore robustness) of my development system

## install:
[INSTALL.md](INSTALL.md)


## (r)icing on the cake:

- System: [`/etc/nixos/configuration.nix`](configuration.nix)
- User: [`~/.nixpkgs/config.nix`](.nixpkgs/config.nix)


### setup:
```
git clone https://github.com/freshdried/dotfiles ~/projects/dotfiles
cd ~/projects/dotfiles
./link.sh
```
