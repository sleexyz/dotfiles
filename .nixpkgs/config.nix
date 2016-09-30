{ pkgs }:
{
  allowUnfree = true;

  packageOverrides = pkgs_: rec {
    patchage = pkgs.callPackage ./myPkgs/patchage.nix {};
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};

    # qlcplus = pkgs.callPackage ./myPkgs/qlcplus.nix {};

    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal-install
        cabal2nix

        (haskell.packages.ghc801.ghcWithPackages (haskellPackages: with haskellPackages; [
          purescript
          alex
          happy

          tidal
          tidal-midi
          stack
        ]))
      ];
    };

    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        # nix
        nixUnstable
        nox
        nix-repl
        nix-prefetch-scripts

        # cli programs
        nmap_graphical
        mplayer
        mpg123
        ncdu
        silver-searcher
        awscli
        p7zip
        gnupg
        ranger

        # x programs
        sxiv
        evince
        firefox
        google-chrome
        ghostscript
        gnome3.cheese
        gnome3.gnome-video-effects
        gimp
        scrot
        guvcview
        poppler_utils
        simplescreenrecorder
        zeal



        # ricing
        compton-git
        rofi
        nitrogen


        # x utilities
        xclip
        xdg_utils
        xorg.xev
        xorg.xbacklight
        arandr

        libv4l
        v4l_utils
        xorg.xeyes
        wmctrl

        # dev tools
        gitAndTools.hub
        neovim
        emacs
        entr
        fantasque-sans-mono
        hack-font
        sox
        testdisk
        parted
        usbutils

        # audio
        patchage
        spectrojack
        qjackctl
        audacity
        meterbridge
        baudline
        timemachine


        # dev things
        pkgconfig
        atom
        go
        python
        gcc
        gnumake
        nodejs-6_x
        electron
        scala
        jdk
        leiningen
        boot
        rlwrap
        coq_8_5
        emacs24Packages.proofgeneral
        ncurses
        xdotool
        smlnj
        debootstrap
        ocaml_4_02
        opam
        subversion
        m4
        ocamlPackages.findlib
        ocamlPackages.utop
        git-cola
        haskellPackages.Agda
        ruby
        scala
        sbt
        git-cola
      ];
    };
  };
}
