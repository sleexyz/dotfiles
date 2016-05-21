{ pkgs }:
{
  allowUnfree = true;


  haskellPackageOverrides = with pkgs.haskell.lib; self: super: {
    vivid = self.callPackage /home/slee2/sandbox/vivid/vivid.nix {};
    # hylogen = self.callPackage /home/slee2/projects/hylogen/hylogen.nix {};
  };

  packageOverrides = pkgs_: rec {
    patchage = pkgs.callPackage ./myPkgs/patchage.nix {};
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};
    # qlcplus = pkgs.callPackage ./myPkgs/qlcplus.nix {};

    # lol clean this up
    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal-install
        cabal2nix

        # (haskell.packages.ghc801.ghcWithPackages (haskellPackages: with haskellPackages; [
        (haskellPackages.ghcWithPackages (haskellPackages: with haskellPackages; [
          purescript
          # idris

          vivid
          # hylogen

          stack
          stylish-haskell hasktags hlint ghc-mod # required for spacemacs
          ghcid
          pointfree
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
        pandoc
        gnupg

        # ranger
        # uncomment when my PR gets through
        ranger

        # x programs
        sxiv
        evince
        firefox
        # (google-chrome.override { channel = "dev";})
        ghostscriptX
        gnome3.cheese
        gnome3.gnome-video-effects
        gimp
        scrot
        guvcview


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

        # dev tools
        gitAndTools.git-annex
        gitFull
        # gitAndTools.hub
        neovim
        emacs
        entr

        # audio
        patchage
        spectrojack
        qjackctl
        # supercollider
        audacity
        meterbridge
        baudline
        timemachine
        espeak


        # dev things
        pkgconfig
        atom
        go
        # python
        gcc
        gnumake
        nodejs-5_x
        electron
        scala
        jdk
        leiningen
        boot
        rlwrap
        coq_8_5
        emacs24Packages.proofgeneral
        ncurses
        # elmPackages.elm
        # haskellPackages.Agda
      ];
    };
  };
}
