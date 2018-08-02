{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation rec {
  name = "gallium-nix-shell";

  flow = pkgs.callPackage ./myPkgs/flow-0.61.0.nix {
    inherit (pkgs.ocamlPackages_4_03) ocaml findlib camlp4 sedlex ocamlbuild ocaml_lwt;
  };

  buildInputs = [ flow ];

  shellHook = ''
    echo "Entering gallium nix-shell"
    zsh
  '';
}
