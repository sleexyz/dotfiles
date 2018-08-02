{ pkgs }:
{
  allowUnfree = true;

  packageOverrides = pkgs_: rec {
    flow = pkgs.callPackage ./myPkgs/flow-0.61.0.nix {
      inherit (pkgs.ocamlPackages_4_03) ocaml findlib camlp4 sedlex ocamlbuild ocaml_lwt;
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
    python2Env = with pkgs; python2.withPackages (ps: with ps; [ 
      j2cli
    ]);
    python3Env = with pkgs; python35.withPackages (ps: with ps; [ 
      pip 
      virtualenv 
      setuptools 
    ]);
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        a2jmidid
        # airwave
        alacritty
        android-studio
        ansible
        arandr
        audacity
        awscli
        baudline
        bind
        bitwig-studio
        colordiff
        compton-git
        docker
        docker_compose
        emacs
        entr
        espeak
        exfat
        fantasque-sans-mono
        file
        firefox
        flow
        gcc
        ghc
        gimp
        gist
        gitAndTools.hub
        gitAndTools.qgit
        git-cola
        git-lfs
        gksu
        gnumake
        gnupg
        go
        google-chrome
        google-chrome-beta
        gparted
        guvcview
        hack-font
        # houdini
        imagemagick
        inkscape
        ipafont
        jmtpfs
        jq
        maim
        meld
        meterbridge
        minecraft
        mixxx
        monodevelop
        mpg123
        mplayer
        mysql
        ncdu
        neovim
        nitrogen
        nodejs-8_x
        ocaml
        ocamlPackages.findlib
        ocamlPackages.ocpIndent
        opam
        p7zip
        pass
        patchage
        pgadmin
        pgcli
        proxychains
        pv
        # python2Env
        python3Env
        qjackctl
        qlcplus
        ranger
        renameutils
        rlwrap
        rofi
        screen
        scrot
        shellcheck
        silver-searcher
        simplescreenrecorder
        slack
        stunnel
        subversion
        supercollider
        sxiv
        tcptrack
        tcpdump
        termite
        terraform
        testdisk
        tigervnc
        tldr
        tmux
        torbrowser
        transmission_gtk
        tsocks
        unzip
        unity3d
        vagrant
        vlc
        vscode
        wireshark-gtk
        w3m
        x2vnc
        xclip
        xdg_utils
        xdotool
        xorg.xbacklight
        xorg.xev
        xorg.xhost
        xxd
        zoom-us
      ];
    };
  };
}
