{ stdenv, fetchFromGitHub, lib, ocaml, libelf, findlib, camlp4, sedlex, ocamlbuild }:

with lib;

stdenv.mkDerivation rec {
  version = "0.51.1";
  name = "flow-${version}";

  src = fetchFromGitHub {
    owner = "facebook";
    repo = "flow";
    rev = "v${version}";
    sha256 = "1ym67d3b5hx12psamc4y3fi0svmpljwk70wazx385d0bsqqmlcsx";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bin/flow $out/bin/
  '';

  buildInputs = [ ocaml libelf findlib camlp4 sedlex ocamlbuild ];

  meta = with stdenv.lib; {
    description = "A static type checker for JavaScript";
    homepage = http://flowtype.org;
    license = licenses.bsd3;
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    maintainers = with maintainers; [ puffnfresh globin ];
  };
}
