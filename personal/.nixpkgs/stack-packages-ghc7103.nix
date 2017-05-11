with import <nixpkgs> {};
with pkgs;
import ./stack-packages-base.nix {
  ghcWithPackages = haskell.packages.ghc7103.ghcWithPackages;
}
