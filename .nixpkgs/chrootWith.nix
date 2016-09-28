{ nixpkgs ? <nixpkgs>
, packages 
, command ?  "bash"
}:

with import nixpkgs {};

let fhs = pkgs.buildFHSUserEnv {
  name = "stack-env";
  targetPkgs = pkgs: (import packages);

  runScript = command;
  profile = ''
    unset SSL_CERT_FILE
    export LANG=en_US.UTF-8
    export TERM=xterm
  '';
};
in stdenv.mkDerivation {
  name = "stack-env-shell";
  nativeBuildInputs = [ fhs ];
  shellHook = ''
    exec stack-env
  '';
}
