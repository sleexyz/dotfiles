{ pkgs }:
{
  allowUnfree = true;


  packageOverrides = pkgs_: rec {
    # patchage = pkgs.callPackage ./myPkgs/patchage.nix {};
    flow = pkgs.callPackage ./myPkgs/flow.nix {};
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};
    # termite = pkgs.callPackage ./myPkgs/termite.nix {
    #   vte = pkgs.gnome3.vte-select-text;
    # };

    # qlcplus = pkgs.callPackage ./myPkgs/qlcplus.nix {};

    # lol clean this up
    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal2nix
        cabal-install

        (haskell.packages.ghc801.ghcWithPackages (haskellPackages: with haskellPackages; [
          zlib digest stack
        ]))
      ];
    };
    pythonEnv = with pkgs; buildEnv {
      name = "pythonEnv";
      paths = [
        python
      ] ++ (with python27Packages; [
        docker_compose
      ]);
    };
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        arandr
        atom
        audacity
        awscli
        baudline
        boot
        chromedriver
        colordiff
        compton-git
        coq_8_5
        debootstrap
        docker
        electron
        emacs
        # emacs24Packages.proofgeneral
        entr
        etherape
        evince
        exfat
        fantasque-sans-mono
        file
        firefox
        flow
        gcc
        ghostscript
        gimp
        gitAndTools.hub
        gitAndTools.qgit
        git-cola
        gnome3.cheese
        gnome3.gnome-video-effects
        gnumake
        gnupg
        gnuplot
        go
        guvcview
        hack-font
        # haskellPackages.Agda
        # haskellPackages.purescript
        heroku
        inotify-tools
        jdk
        jq
        leiningen
        libv4l
        m4
        maim
        meld
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
        opam
        p7zip
        patchage
        patchelf
        phantomjs
        pkgconfig
        poppler_utils
        postgresql
        pv
        qjackctl
        ranger
        renameutils
        rlwrap
        rofi
        ruby
        sbt
        scala
        scrot
        shellcheck
        silver-searcher
        simplescreenrecorder
        slack
        slop
        smlnj
        snappy
        sox
        spectrojack
        subversion
        sxiv
        tcptrack
        timemachine
        termite
        tmate
        tmux
        unzip
        v4l_utils
        wireshark-gtk
        wmctrl
        w3m
        xclip
        xdg_utils
        xdotool
        xorg.xbacklight
        xorg.xev
        xorg.xeyes
        xvfb_run
        zeal
        zlib
        zoom-us
      ];
    };
  };
}
