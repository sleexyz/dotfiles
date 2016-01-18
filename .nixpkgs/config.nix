{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {

    # lol clean this up
    ghcEnv = with pkgs; buildEnv {
      name = "ghcEnv";
      paths = [
        cabal-install
        cabal2nix

        (haskellPackages.ghcWithHoogle (haskellPackages: with haskellPackages; [
          halive
          stack
          purescript
          idris
          stylish-haskell
          hlint
          hasktags
          # ghc-mod
        ]))
      ];
    };

    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        # nix
        nox
        nix-repl

        # cli programs
        nmap_graphical
        mplayer
        ncdu

        # ranger
        # uncomment when my PR gets through
        # ranger
        # w3m
        # file 

        # x programs
        sxiv


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

        # audio
        qjackctl
        supercollider

        # dev things
        atom
        go
        gcc
        gnumake
        nodejs-5_x
        electron
      ];
    };
  };
}
