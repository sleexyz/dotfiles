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

        # ranger
        ranger
        w3m
        file

        # x programs
        xclip
        sxiv
        xdg_utils

        # ricing
        compton-git
        rofi
        nitrogen

        # development
        go
        gcc
        gnumake
        gitAndTools.hub
        neovim
      ];
    };
  };
}
