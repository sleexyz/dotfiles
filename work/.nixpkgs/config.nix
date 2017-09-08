{ pkgs }:
{
  allowUnfree = true;

  packageOverrides = pkgs_: rec {
    flow = pkgs.callPackage ./myPkgs/flow.nix {
      inherit (pkgs.ocamlPackages_4_03) ocaml findlib camlp4 sedlex ocamlbuild;
    };
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};
    bitwig-studio = pkgs.callPackage ./myPkgs/bitwig-studio.nix {
      zenity = pkgs.gnome2.zenity;
    };
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
        audacity
        awscli
        baudline
        boot
        colordiff
        compton-git
        docker
        emacs
        entr
        espeak
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
        gist
        # gitAndTools.hub
        gitAndTools.qgit
        git-cola
        gnome3.cheese
        gnome3.gnome-video-effects
        gnumake
        gnupg
        gnuplot
        go
        google-chrome
        guvcview
        hack-font
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
        netcat-gnu
        nitrogen
        nix-prefetch-scripts
        nix-repl
        nixUnstable
        nmap_graphical
        nodejs-8_x
        nox
        opam
        p7zip
        parted
        patchage
        patchelf
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
        sox
        spectrojack
        stunnel
        subversion
        sxiv
        tcptrack
        termite
        testdisk
        timemachine
        tmux
        unzip
        usbutils
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
      ];
    };
  };
}
