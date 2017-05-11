{ stdenv, fetchFromGitHub, lib, ocaml_4_02, libelf }:

with lib;

stdenv.mkDerivation rec {
  version = "0.43.1";
  name = "flow-${version}";

  src = fetchFromGitHub {
    owner = "facebook";
    repo = "flow";
    rev = "v${version}";
    sha256 = "0xvjjx929yhlfpajz22f14gbvpnrsymhhxn0jnq5wg4v51dvwx5g";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bin/flow $out/bin/
  '';

  buildInputs = [ ocaml_4_02 libelf ];

  meta = with stdenv.lib; {
    description = "A static type checker for JavaScript";
    homepage = http://flowtype.org;
    license = licenses.bsd3;
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    maintainers = with maintainers; [ puffnfresh globin ];
  };
}
