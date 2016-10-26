with import <nixpkgs> {};
with pkgs;
{ ghcWithPackages 
}:

[ 
  stack
  icu
  snappy
  git
  cacert
  iana_etc
  ncurses.dev
  postgresql
  gcc
  glibc
  (ghcWithPackages (haskellPackages: with haskellPackages; [
    zlib
    text-icu
    terminfo
  ]))
  haskellPackages.purescript
  gitAndTools.hub
  emacs 
  neovim
  zsh
  nodejs-6_x
  silver-searcher
  kde4.okular
  graphviz
  python
  gnumake
  phantomjs
  zlib
  gmp
  rxvt_unicode
]
