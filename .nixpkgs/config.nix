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

        (haskellPackages.ghcWithHoogle (haskellPackages: with haskellPackages; [
          purescript
          idris

          halive
          stack
          stylish-haskell
          hlint
          hint
          # vivid
          hasktags
          ghc-mod
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
        ncdu
        silver-searcher
        awscli

        # ranger
        # uncomment when my PR gets through
        ranger

        # x programs
        sxiv
        evince


        # ricing
        compton-git
        rofi
        nitrogen

        # x utilities
        xclip
        xdg_utils
        xorg.xev
        xorg.xbacklight

        # dev tools
        gitAndTools.hub
        neovim
        emacs
        yi
        entr

        # audio
        patchage
        spectrojack
        qjackctl
        jack_oscrolloscope
        supercollider


        # dev things
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
        haskellPackages.Agda
      ];
    };
  };
}
