{ pkgs }:
{
  allowUnfree = true;

  packageOverrides = pkgs_: rec {
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};
    bitwig-studio = pkgs.callPackage ./myPkgs/bitwig-studio.nix {
      zenity = pkgs.gnome2.zenity;
    };
    flow = pkgs.callPackage ./myPkgs/flow.nix {};

    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal-install
        cabal2nix
        stack
        (haskell.packages.ghc801.ghcWithPackages (haskellPackages: with haskellPackages; [
          purescript
          alex
          happy
          tidal
          zlib
        ]))
      ];
    };

    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        aws
        arandr
        audacity
        avahi
        awscli
        baudline
        bitwig-studio
        boot
        compton-git
        docker
        emacs
        entr
        evince
        fantasque-sans-mono
        firefox
        flow
        gcc
        ghostscript
        gimp
        gitAndTools.hub
        git-cola
        gnome3.cheese
        gnome3.gnome-video-effects
        gnumake
        gnupg
        go
        google-chrome
        guvcview
        hack-font
        haskellPackages.Agda
        jdk
        jq
        leiningen
        libv4l
        m4
        minecraft
        meterbridge
        mpg123
        mplayer
        ncdu
        ncurses
        neovim
        nitrogen
        nix-prefetch-scripts
        nix-repl
        nixUnstable
        nmap_graphical
        nodejs-6_x
        nox
        openvpn
        p7zip
        parted
        patchage
        pkgconfig
        poppler_utils
        python
        qjackctl
        ranger
        renameutils
        rlwrap
        rofi
        ruby
        sbt
        scala
        scala
        scrot
        silver-searcher
        simplescreenrecorder
        smlnj
        sox
        spectrojack
        stunnel
        subversion
        supercollider
        sxiv
        termite
        testdisk
        timemachine
        torbrowser
        usbutils
        v4l_utils
        vscode
        wmctrl
        xclip
        xdg_utils
        xdotool
        xorg.xbacklight
        xorg.xev
        xorg.xeyes
        zeal
      ];
    };
  };
}
