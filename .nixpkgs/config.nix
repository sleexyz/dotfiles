{ pkgs }:
{
  allowUnfree = true;


  haskellPackageOverrides = with pkgs.haskell.lib; self: super: {
    vivid = self.callPackage /home/slee2/sandbox/vivid/vivid.nix {};
  };

  packageOverrides = pkgs_: rec {
    patchage = pkgs.callPackage ./myPkgs/patchage.nix {};
    spectrojack = pkgs.callPackage ./myPkgs/spectrojack.nix {};

    # lol clean this up
    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal-install
        cabal2nix

        (haskellPackages.ghcWithPackages (haskellPackages: with haskellPackages; [
          purescript
          # idris

          vivid

          stack
          stylish-haskell hasktags hlint ghc-mod # required for spacemacs
          hint
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

        # ranger
        # uncomment when my PR gets through
        ranger

        # x programs
        sxiv
        evince
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

        # dev tools
        gitAndTools.git-annex
        gitAndTools.hub
        neovim
        emacs
        yi
        entr

        # audio
        patchage
        spectrojack
        qjackctl
        supercollider
        audacity
        meterbridge
        baudline
        timemachine


        # dev things
        pkgconfig
        atom
        go
        gcc
        gnumake
        nodejs-5_x
        electron
        scala
        jdk
        leiningen
        boot
        rlwrap
        # elmPackages.elm
        # haskellPackages.Agda
      ];
    };
  };
}
