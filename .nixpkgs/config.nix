{ pkgs }:
{
  allowUnfree = true;

  packageOverrides = pkgs_: rec {
    # patchage = pkgs.callPackage ./myPkgs/patchage.nix {};
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};
    supercollider = pkgs.callPackage ./myPkgs/supercollider.nix {};

    # qlcplus = pkgs.callPackage ./myPkgs/qlcplus.nix {};

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
        arandr
        atom
        audacity
        avahi
        awscli
        baudline
        boot
        compton-git
        debootstrap
        docker
        electron
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
        leiningen
        libv4l
        m4
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
        # ocaml_4_02
        # ocamlPackages.findlib
        # ocamlPackages.utop
        # opam
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
