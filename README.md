# dotfiles

## sync between two machines
```
meld work personal
```
## download my branch of nixpkgs
```
git clone git@github.com:sleexyz/nixpkgs "$HOME/my-nixpkgs"
```

## install user packages
```
nix-env -f ~/my-nixpkgs -i all
```
