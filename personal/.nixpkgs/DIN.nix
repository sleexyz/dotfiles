with import <nixpkgs> {};
with pkgs;
[
  git
  cacert
  iana_etc
  gitAndTools.hub
  zsh
  neovim
  nodejs-8_x
  google-chrome
  termite
  # for chromedriver
  cairo
  fontconfig
  freetype
  gnome3.gconf
  gdk_pixbuf
  glib
  glibc
  gtk2
  jdk
  xorg.libXext
  xorg.libXi
  xorg.libXrender
  nspr
  nss
  pango
  unzip
  xorg.libX11

  # DIN
  SDL.dev
  boost
  tcl
  libjack2
  gcc
  gnumake
  mesa
  glib
]
