{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {
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

          # dev things
          go
          gcc
          gnumake

          # haskell things
          (haskellPackages.ghcWithHoogle
            (haskellPackages: with haskellPackages; [
              stack
              purescript
              idris
          ]))
        ];
      };
      test = pkgs.myEnvFun {
        name = "test";
        buildInputs = [ cowsay ];
      };
    };
}
