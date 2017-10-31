{ pkgs }:
{
  allowUnfree = true;

  packageOverrides = pkgs_: rec {
    flow = pkgs.callPackage ./myPkgs/flow-0.55.0.nix {
      inherit (pkgs.ocamlPackages_4_03) ocaml findlib camlp4 sedlex ocamlbuild;
    };
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};
    bitwig-studio = pkgs.callPackage ./myPkgs/bitwig-studio.nix {
      zenity = pkgs.gnome2.zenity;
    };
    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal-install
        cabal2nix
        stack
        (haskell.packages.ghc802.ghcWithPackages (haskellPackages: with haskellPackages; [
          alex
          happy
          hspec
          zlib
          alsa-seq
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
        a2jmidid
        arandr
        ardour
        audacity
        avahi
        awscli
        baudline
        bitwig-studio
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
        fluidsynth
        fontmatrix
        gcc
        ghostscript
        ghcEnv
        gimp
        gist
        gitAndTools.hub
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
        # haskellPackages.Agda
        ipafont
        jdk
        jq
        leiningen
        libv4l
        libjack2
        m4
        maim
        meld
        meterbridge
        minecraft
        mixxx
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
        openvpn
        ocaml
        ocamlPackages.findlib
        ocamlPackages.ocpIndent
        opam
        p7zip
        parted
        patchage
        patchelf
        pkgconfig
        poppler_utils
        pv
        python
        pythonEnv
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
        socat
        sox
        spectrojack
        stunnel
        subversion
        supercollider
        sxiv
        tcptrack
        tcpdump
        termite
        terraform
        testdisk
        timemachine
        tmux
        torbrowser
        transmission_gtk
        tsocks
        uim
        # unity3d
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
        xxd
        xvfb_run
        zeal
        zynaddsubfx
      ];
    };
  };
}
